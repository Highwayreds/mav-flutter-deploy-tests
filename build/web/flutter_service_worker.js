'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "697aca4167a9c211f3f6db85c7d9743c",
"index.html": "da1de5b5a5c54cee222a8ca44d56d0ea",
"/": "da1de5b5a5c54cee222a8ca44d56d0ea",
"main.dart.js": "764dc8f7bb6e7ee9f8834228cc45d9df",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "7f05a3e303c26bc43587212e43b850f3",
"assets/AssetManifest.json": "c723f65252c89486d2cfaaf09929fa39",
"assets/NOTICES": "3970c2f1a094d6f036e9b0816c4a4268",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/assets/arq2.png": "2853488a87373e50181f72981bdbeded",
"assets/assets/bathroomB/orange.png": "2eb9156860aacf00ff18d8395e62e9eb",
"assets/assets/bathroomB/green.png": "c753237363ee24c440c8b714f8ad6e35",
"assets/assets/bathroomB/red.png": "f242cd842fa4dfd1c6d024f87d2b655c",
"assets/assets/aisles/1/orange.png": "7477bc7833d5f70aa9d5263296d15730",
"assets/assets/aisles/1/green.png": "977cb836f26068fc2ad6e636d258080b",
"assets/assets/aisles/1/red.png": "43dc601ebcea0511e01fb1fc1bb25a74",
"assets/assets/aisles/4/orange.png": "09afb648feb96a080b52779a59db2d1c",
"assets/assets/aisles/4/green.png": "f053b3d852f383520459f84d6717a95a",
"assets/assets/aisles/4/red.png": "6db6976471ec1323a1e2f5d7df25983b",
"assets/assets/aisles/3/orange.png": "39f5de2fd3da0d4a439255cd0877aa0f",
"assets/assets/aisles/3/green.png": "d407ed2e4d3cfc4f2cb4ea7608b62623",
"assets/assets/aisles/3/red.png": "2973baf7615b94a0ddf1e4c0ef0f10f5",
"assets/assets/aisles/2/orange.png": "451030ad93a9071f7991a19b0525bfad",
"assets/assets/aisles/2/green.png": "7964efc6be0a450f3d0af8d727554ef0",
"assets/assets/aisles/2/red.png": "0ebedab32ced5723c1f8e1de0bc0321c",
"assets/assets/orange.png": "9d1c3949bc99dcb6dd2b144e1afa0793",
"assets/assets/green.png": "7c01aea4c16ab7774b0a0b5c4a9a0b73",
"assets/assets/bathroomA/orange.png": "24520eadb6a341fd1f5cffe25249a980",
"assets/assets/bathroomA/green.png": "6026d8922aeef3227f5595319254e815",
"assets/assets/bathroomA/red.png": "808f99630bdbe163ce99463f323de2bb",
"assets/assets/bar/orange.png": "20ff32ffa3932675b70c026c21542248",
"assets/assets/bar/green.png": "bbaee8945273410404e93be8c207218b",
"assets/assets/bar/red.png": "4a400fb79c13c703e7aed4b63240780c",
"assets/assets/arq.png": "9d6619bcf4f63ddf3fe018c1cc9920b6",
"assets/assets/transparent.png": "bff6cc339e13d5a3fb7e173a9f4c9b34",
"assets/assets/red.png": "0cdc9b952c63e1ed9b9dac3f3eb555b2"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
