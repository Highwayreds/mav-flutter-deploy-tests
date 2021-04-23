'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "697aca4167a9c211f3f6db85c7d9743c",
"index.html": "450c405bfa390d6b559dd6eb6756e46e",
"/": "450c405bfa390d6b559dd6eb6756e46e",
"main.dart.js": "f41aee71482647587b20f241021d3548",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "7f05a3e303c26bc43587212e43b850f3",
"assets/AssetManifest.json": "7b97f48e2a67c0be54328ea2a02e8cb9",
"assets/NOTICES": "3970c2f1a094d6f036e9b0816c4a4268",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/assets/arq2.png": "2853488a87373e50181f72981bdbeded",
"assets/assets/bathroomB/orange.png": "2eb9156860aacf00ff18d8395e62e9eb",
"assets/assets/bathroomB/red.png": "f242cd842fa4dfd1c6d024f87d2b655c",
"assets/assets/mascots/lector/lector-s1.png": "f693778494a9dd7be05a36b9ef85a0ae",
"assets/assets/mascots/lector/lector-s3.png": "6ff5aff18da5480dbf06e28c29d164c6",
"assets/assets/mascots/lector/lector-s5.png": "71c16d4dd1b0d5eb07802bba77194892",
"assets/assets/mascots/cuppy/cuppy-s3.png": "4b6ca272f094e1cee7e2f80201121448",
"assets/assets/mascots/cuppy/cuppy-s1notasbig.png": "68caffee12b97ef69244bb90e8cbed76",
"assets/assets/mascots/cuppy/cuppy-s2.png": "6df4a2403a8d2cd9a18d523098cbf365",
"assets/assets/mascots/cuppy/cuppy-s1.png": "b3e4319b68842071f458d5ac8cf73d7c",
"assets/assets/mascots/cuppy/cuppy-s5.png": "cdee1e1d199a964790721cc85637e6a0",
"assets/assets/mascots/cuppy/cuppy-s4.png": "45e91e2826ad23b72daa67a08b8e418d",
"assets/assets/mascots/cuppy/cuppy-g1.gif": "536ae725779cec562c0d25294ca83188",
"assets/assets/mascots/cuppy/cuppy-s1smallerthannotasbig.png": "bad8f6bc921ffa9e0dbc0f9f53182117",
"assets/assets/mascots/boothy/boothy-s1.png": "f250981487ff3dfdfc4c110aacc836b0",
"assets/assets/mascots/boothy/boothy-s3.png": "14385bdfdf15fcbe72259fc0647494cc",
"assets/assets/mascots/boothy/boothy-s5.png": "0dc98e273326e398722223e80ef150ab",
"assets/assets/mascots/dobby/dobby-s5.png": "e3d884d76b8081cef7513d60d44337cd",
"assets/assets/mascots/dobby/dobby-s1.png": "a8f37c841f1376843c71591dec720542",
"assets/assets/mascots/dobby/dobby-s3.png": "2939be71852ca4cb8a2a514a8b475cce",
"assets/assets/mascots/boggy/boggy-s3.png": "0f749dfe0f99acd937d4f27411f14ffc",
"assets/assets/mascots/boggy/boggy-s1.png": "9386c914d059cb2ec3de9735e095bff1",
"assets/assets/mascots/boggy/boggy-s5.png": "03850a2a89d9b03ff452246a72fd5cf5",
"assets/assets/mascots/healthbar/health_bar_empty_4_64.png": "2afcdadeb17c61246026c9970a2e0d8e",
"assets/assets/mascots/healthbar/health_bar_filled_4_64.png": "cb840dd8163603961363271cea83f462",
"assets/assets/mascots/healthbar/empty.png": "bb3642ccaa1ae758fd4f140f1a3456db",
"assets/assets/mascots/healthbar/heart.png": "0983c567cd71d104ab0c74fc5d432428",
"assets/assets/mascots/healthbar/half.png": "83a88cc73c7753e9a9b9dc74d931326c",
"assets/assets/mascots/healthbar/health_bar_half_4_64.png": "6f989ba65bc1c68153f1380f4a604f4e",
"assets/assets/mascots/healthbar/full.png": "0560cec2755553243a59ee6d2389050f",
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
"assets/assets/bathroomA/red.png": "808f99630bdbe163ce99463f323de2bb",
"assets/assets/bar/orange.png": "20ff32ffa3932675b70c026c21542248",
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
