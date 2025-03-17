'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "930a603cbe17d16bab13a51f625a62dc",
"version.json": "009c9e65172e010890f7f65fde438006",
"favicon.ico": "5cabae740e6f75f06c3a94d026e5e1c7",
"index.html": "0de4448e31fafcbcb5e4098a3510e746",
"/": "0de4448e31fafcbcb5e4098a3510e746",
"main.dart.js": "04ca261fd69af5f535b9f43d8893635a",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "a407ddb5d2db47600305df022a316bf2",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"assets/AssetManifest.json": "f1bf7ee950c68972203b44c9af6fa160",
"assets/NOTICES": "195625932b5749a87316e82b781a0e74",
"assets/FontManifest.json": "9c21caa7864bb4c073a8e7ded5b20dbc",
"assets/AssetManifest.bin.json": "5e85e1236f0c32bf6ed76f085d9283cc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "c99dd926e2bced69aa2d2bd247970a1e",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/images/mockup.png": "8b5e75c09c78f56d1f7c10c86507cacb",
"assets/assets/images/apple.png": "4f658b9a7d067de5238644b78d8d09cc",
"assets/assets/images/mockups/oyh_1.webp": "e111d6d62ba7d9994d80cf6b140f40b0",
"assets/assets/images/mockups/fary_2.webp": "cb376d29f6832ec391ced2cf071cb16b",
"assets/assets/images/mockups/l2e_2.webp": "5d87fa91fc5bb9acbc4ccaa100276a66",
"assets/assets/images/mockups/gbi_2.webp": "052e596ed96d94eee4b5d47ebb43ddbd",
"assets/assets/images/mockups/khin_collections_2.webp": "7f7f6a3c4946dc813dfea8e066ad4927",
"assets/assets/images/mockups/htawara_1.webp": "a3faa803847510600ad73574bc7f26fb",
"assets/assets/images/mockups/ngwe_zay_2.webp": "d10aec3ef92e4b7eadacecb35535b131",
"assets/assets/images/mockups/ngwe_zay_1.webp": "c9eb1ce98f25b9a620cfbc2a3266fa9e",
"assets/assets/images/mockups/khin_collections_1.webp": "bc777e5ac41e528f6fb654965d381deb",
"assets/assets/images/mockups/htawara_2.webp": "5553ea9b76ee477a691115f6d6feb9bf",
"assets/assets/images/mockups/gbi_1.webp": "27f13ad269d46bd933e418487b1cf852",
"assets/assets/images/mockups/l2e_1.webp": "3e7633bbee70713ac9c59f1c365092f9",
"assets/assets/images/mockups/fary_1.webp": "0840642d79f9793a1c9787150a0ed1e2",
"assets/assets/images/mockups/oyh_2.webp": "4ef94986682208d123a5b6b2eff37d6d",
"assets/assets/images/profile.JPG": "700a371b1834f5bec51f13757e8513f4",
"assets/assets/images/profile.png": "0f6dec35517d77c2f5e1e7d94a69b1b7",
"assets/assets/images/playstore.png": "18fab95d924ef304111a8efd2620c0a6",
"assets/assets/icons/home.svg": "b5b1cb5f945cd125f7c96cf64ac7bbdd",
"assets/assets/icons/github.svg": "6d56e2252e753e2729d2afc16ec32d04",
"assets/assets/icons/flutter.svg": "e590d78b8e330555e41856d397193473",
"assets/assets/icons/instagram.svg": "98a45441061651c66ddc2cb80ff48736",
"assets/assets/icons/projects.svg": "595e452a6fd2b72bd78633404f8e7ec3",
"assets/assets/icons/python.svg": "85368627053aa7df8e1340c0f29acdb8",
"assets/assets/icons/mail.svg": "b52330915069b07db6807b3f87a04a52",
"assets/assets/icons/dark.svg": "6cf5aebcbc80603f1e966f2c03a11b59",
"assets/assets/icons/kotlin.svg": "d02f3e38dc76bdaf7db9be71525afe7f",
"assets/assets/icons/fastapi.svg": "550f25221177afd88bfac3de9adf7a5b",
"assets/assets/icons/dart.svg": "e8f7e9dd5dfc0fa8b5b4af6adbe66aba",
"assets/assets/icons/about.svg": "dec89967ca8e80c88ea1fc41b0a68884",
"assets/assets/icons/linkedIn.svg": "61cb8d84d4f228958bdd13bcd448f172",
"assets/assets/icons/swift.svg": "f6e3663a0edaa32d72b45dfd41414cc4",
"assets/assets/icons/light.svg": "e75821812925fa3fddad6885b8671c00",
"assets/assets/lottie/mouse_scroll.json": "4b42c36e3bd29a8223cde03a73d1e95f",
"assets/assets/lottie/mouse_scroll_dark.json": "fa6d2de4d40ecc255eb601115b0800ca",
"assets/assets/fonts/OpenSans-SemiBold.ttf": "e2ca235bf1ddc5b7a350199cf818c9c8",
"assets/assets/fonts/OpenSans-ExtraBold.ttf": "f0af8434e183f500acf62135a577c739",
"assets/assets/fonts/OpenSans-Bold.ttf": "0a191f83602623628320f3d3c667a276",
"assets/assets/fonts/OpenSans-Medium.ttf": "dac0e601db6e3601159b4aae5c1fda39",
"assets/assets/fonts/OpenSans-Regular.ttf": "931aebd37b54b3e5df2fedfce1432d52",
"assets/assets/animations/theme.riv": "9ade708a47a21bb0e3c40db25707d146",
"assets/assets/animations/avatar.riv": "a0493be7c280be360bae3ab667ae7762",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
