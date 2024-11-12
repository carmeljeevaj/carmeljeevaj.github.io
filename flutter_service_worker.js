'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "3b11df929b1486ecae5c6a150695c296",
"version.json": "3d76919590f5f03ee91dd91a2241916e",
"index.html": "ce13c4d814799345a95f1c34b37d028e",
"/": "ce13c4d814799345a95f1c34b37d028e",
"main.dart.js": "5033992561ab3aad8e7773d4c5c564f3",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "984fcb50a51d98c9813b4d3a37ade38a",
"assets/gold.json": "9fe432020e89b3fac80991d176dd84ef",
"assets/lottie_thumbsdown.json": "ebcd53fc3106f119297ba8d09ae6235c",
"assets/silver.json": "74adf3cc78b6bcd9617173143046015d",
"assets/images/q11.jpg": "923d383ed853e0eda73ca7ae9c866044",
"assets/images/q10.jpg": "61d2b9f6402f50c423e5b6244c63f047",
"assets/images/q12.jpg": "f01730b898ef7947e3e26135d17c7875",
"assets/images/q13.jpg": "fb94cd3cece8a60f16dd6a16abee5384",
"assets/images/q17.jpg": "cdb541b5fa233a40717db990aac7c390",
"assets/images/q17.webp": "55b20dc56fa117398dfd3eaa404d65f6",
"assets/images/q8.jpg": "b71e4605bb67313e47e968b02835fafb",
"assets/images/q9.jpg": "45beb85d894e0226729d99e2a9b84f7f",
"assets/images/q16.jpg": "1f223c66701311a3bb5b294ea2a30672",
"assets/images/q14.jpg": "b3650774eb9d5c4cad47775b107c318f",
"assets/images/q15.jpg": "79528a26bcf5ebbb58fafcd02a9b9dff",
"assets/images/q18.jpg": "67e5d990fd8cabf78a19452343c7d269",
"assets/images/q7.jpg": "0e48f7308235f84d467d08d927e5d7f4",
"assets/images/q6.jpg": "8dc87957832fd856193b4378865a8d26",
"assets/images/q19.jpg": "9b633e4b332c4e25cefb856118a272c3",
"assets/images/q4.jpg": "437f24b9b4ef778f26518764d2734668",
"assets/images/q5.jpg": "83c87b24a9fde1c3d89159b0bdf3fe58",
"assets/images/q1.jpg": "20e8d9a8426b70bb7885543ed43e1f66",
"assets/images/q2.jpg": "b80ccc347089f91059e966c6900a818b",
"assets/images/q3.jpg": "a8e686155c0ed027b2051438c4ab2e87",
"assets/images/q20.jpg": "46a35471604ce9c635b7702bcf13cdf0",
"assets/lottie_sad.json": "2b20861bc811ea67fdacb6b5fdcbfc1a",
"assets/lottie_neutral.json": "96d62d11a7c9b511dca96ed57fcb458e",
"assets/AssetManifest.json": "52204dc5aa2ba5d9a056554b0e6cc12f",
"assets/lottie_thinking.json": "8d2524d7d37ad567481b54726b72760c",
"assets/NOTICES": "cdd7cd32986351dd7ba1b9ca5c0ab818",
"assets/lottie_thumbsup.json": "5793ba3795d4deb908087ad507d6c122",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "9e3f1c50a862b355c126637decbc2493",
"assets/icons/smiley.png": "44435ee8c49d4fd235ceb911f0fa8212",
"assets/icons/sad.png": "fad0d21863486e9fef44e02f642d2954",
"assets/icons/thumbs_up.png": "6ba7009bebc4877ee53a2a1aff082c34",
"assets/icons/confused.png": "7aaa9691248486682948d20575f3778b",
"assets/icons/hand.png": "c1fb78f167c904897f9eecaff01515f9",
"assets/icons/thinking.png": "f7274b742de2ce0ed3252da82810cf86",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "87f38668abe1ad0c24eb44c043252ab6",
"assets/bronze.json": "5d0e0a817ec196c32a95f9480910652b",
"assets/fonts/MaterialIcons-Regular.otf": "a9598549df7838ac866ab97efdb1ab55",
"assets/assets/gold.json": "9fe432020e89b3fac80991d176dd84ef",
"assets/assets/lottie_thumbsdown.json": "ebcd53fc3106f119297ba8d09ae6235c",
"assets/assets/silver.json": "74adf3cc78b6bcd9617173143046015d",
"assets/assets/images/q11.jpg": "923d383ed853e0eda73ca7ae9c866044",
"assets/assets/images/q10.jpg": "61d2b9f6402f50c423e5b6244c63f047",
"assets/assets/images/q12.jpg": "f01730b898ef7947e3e26135d17c7875",
"assets/assets/images/q13.jpg": "fb94cd3cece8a60f16dd6a16abee5384",
"assets/assets/images/q17.jpg": "cdb541b5fa233a40717db990aac7c390",
"assets/assets/images/q8.jpg": "b71e4605bb67313e47e968b02835fafb",
"assets/assets/images/q9.jpg": "45beb85d894e0226729d99e2a9b84f7f",
"assets/assets/images/q16.jpg": "1f223c66701311a3bb5b294ea2a30672",
"assets/assets/images/q28.jpg": "3e7a21d65c6b8ccd68e809fc27e8e142",
"assets/assets/images/q14.jpg": "b3650774eb9d5c4cad47775b107c318f",
"assets/assets/images/q15.jpg": "79528a26bcf5ebbb58fafcd02a9b9dff",
"assets/assets/images/q29.jpg": "cc6b6735cc53441338d6365489d1492d",
"assets/assets/images/q30.jpg": "7b4c403522c50c95d0c092dcb694ac5b",
"assets/assets/images/q24.jpg": "5a5dc0b13067f99354658ef76f8d592c",
"assets/assets/images/q18.jpg": "67e5d990fd8cabf78a19452343c7d269",
"assets/assets/images/q7.jpg": "0e48f7308235f84d467d08d927e5d7f4",
"assets/assets/images/q6.jpg": "8dc87957832fd856193b4378865a8d26",
"assets/assets/images/q19.jpg": "9b633e4b332c4e25cefb856118a272c3",
"assets/assets/images/q25.jpg": "39070fd86bbd41567f05bd5cf9f15066",
"assets/assets/images/q31.jpg": "9a1650a2bde422969a42dbcd9c8617cd",
"assets/assets/images/q27.jpg": "fa60f2884ab5b046892a5b1b90067744",
"assets/assets/images/q33.jpg": "a121206f9eee40a2e676c258206c8a0d",
"assets/assets/images/q4.jpg": "437f24b9b4ef778f26518764d2734668",
"assets/assets/images/q5.jpg": "83c87b24a9fde1c3d89159b0bdf3fe58",
"assets/assets/images/q32.jpg": "971e627132b446bd32181720574d7a0b",
"assets/assets/images/q26.jpg": "43fbd37ae587cf4e97f49f1911d4229f",
"assets/assets/images/q22.jpg": "022e24aaaea1a40f651b69e0f6966a24",
"assets/assets/images/q36.jpg": "c156af0e0a83cd9d97f91fe9cf2abd4d",
"assets/assets/images/q1.jpg": "20e8d9a8426b70bb7885543ed43e1f66",
"assets/assets/images/q37.jpg": "9b285ceb5722281409a4ebbacbe18d92",
"assets/assets/images/q23.jpg": "939c2332fed5641e5c20d0b6cf828f3a",
"assets/assets/images/q35.jpg": "80a7a362239231e9a3bb6bcbfcb5a5fa",
"assets/assets/images/q21.jpg": "46aa673230017ba9fa66b7f3cb18ef3e",
"assets/assets/images/q2.jpg": "b80ccc347089f91059e966c6900a818b",
"assets/assets/images/q3.jpg": "a8e686155c0ed027b2051438c4ab2e87",
"assets/assets/images/q20.jpg": "46a35471604ce9c635b7702bcf13cdf0",
"assets/assets/images/q34.jpg": "c873bb7e302f1073a7689ef668fb3029",
"assets/assets/lottie_sad.json": "2b20861bc811ea67fdacb6b5fdcbfc1a",
"assets/assets/lottie_neutral.json": "96d62d11a7c9b511dca96ed57fcb458e",
"assets/assets/lottie_thinking.json": "8d2524d7d37ad567481b54726b72760c",
"assets/assets/lottie_thumbsup.json": "5793ba3795d4deb908087ad507d6c122",
"assets/assets/icons/smiley.png": "44435ee8c49d4fd235ceb911f0fa8212",
"assets/assets/icons/sad.png": "fad0d21863486e9fef44e02f642d2954",
"assets/assets/icons/thumbs_up.png": "6ba7009bebc4877ee53a2a1aff082c34",
"assets/assets/icons/confused.png": "7aaa9691248486682948d20575f3778b",
"assets/assets/icons/hand.png": "c1fb78f167c904897f9eecaff01515f9",
"assets/assets/icons/thinking.png": "f7274b742de2ce0ed3252da82810cf86",
"assets/assets/bronze.json": "5d0e0a817ec196c32a95f9480910652b",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
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
