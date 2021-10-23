'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "44bea7a37a77dfc9dcf7db63ab28ca09",
".git/config": "07a6e6e96a602798188bd834d4ba1556",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "d9f68ca351315dc741e0cd387db33f5a",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "38b1db71168d94e23c94e6fa95296dee",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "eb2b0df303600470ceb0290b953fc228",
".git/logs/refs/heads/main": "fd554b7b5a7da82b28631032ad19f445",
".git/logs/refs/remotes/origin/main": "51363b0c0b55485791a868014bc3d92b",
".git/objects/01/c267c59ceb5e9bafad8ef5b30ef5ee0b0053ec": "bb391517243ae19cac37631a13092a0c",
".git/objects/03/c40825f469473bbd3d865039eec69774d94088": "8bb7a0ffeed9ab83acfea93c9311937e",
".git/objects/04/2e1f84771c6b6e6f9fdcf20fe4f6a787cbf001": "06302c67f3c0c7a2bd86ac9f7b76ce38",
".git/objects/0d/6ae7989c0d84b655a797c632375da80082e891": "2cf78806eb48199bb439144907fed421",
".git/objects/0f/1e71a8422f2cc5943a881b8a0cba1a7aee168b": "41292d5b2439a0f9f6b4590c411cdc5e",
".git/objects/17/0c1ad9b6e480b6e91f1b1c9f1117920c47c252": "f7030f408657847911c704c954dd9773",
".git/objects/1f/8f95726d465bb933900884cca0cc47ffa8c992": "8b9a06b17f1adceedfce7dca5bfc4055",
".git/objects/20/5bb5db271c6d8de8399864c7bb9b917f638893": "c993b22f115d7f3ae6d5b7b212806539",
".git/objects/28/ad0a3e49291803c4524db6f70241c5f9350f32": "872d1109aaf0c5e522bb6bf330898076",
".git/objects/31/cd6e293fc99ec92ce005c7e59d6ef86c018b54": "ecda94927ce16b7e2d980865bae7be53",
".git/objects/32/46ad559eeae0370195978eaed83f1053ee13fd": "a043dbc0a0bda96ce2127799ccc27506",
".git/objects/33/cae319ba930dd1b8f14685723bb69e17c2e77e": "4e09aa735c31518c3097d2d18d7fdb61",
".git/objects/38/0d8db560a97f6034009900564e0ab62540e08c": "32e0e0b59c507836961b66f8cba69e38",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4a/46e175a3d58e8daadc7db339f125345779c6e8": "8ee84be992576690223348272b815504",
".git/objects/4d/da1eed3ca23c987e211163c991c07bb1b557ec": "d732dd84c26323c764315d09bb4ad619",
".git/objects/57/267bb204171f268b70217a1f88cd329d910c03": "7768401eeac36665e53327a891d7784d",
".git/objects/5a/a9ccac836697fba7046654fdf7eba47739fe5f": "6e8c7ad340d9f81a45e1b604f769fe66",
".git/objects/5a/eb0adc4e885813c873bec4939fd44d4818032d": "a8993e74b994fcadd5ca05a9c29a05ef",
".git/objects/5e/b50a96b82d4502d1d84f8ba8cf497b50224cce": "f5e12fb2d54d4c1c37adbe0c331e7170",
".git/objects/5e/eef5e0cf74abf4e311c03d6484bd550c66825c": "d00510352a3a2cc9e433fb3e5cc6ec9c",
".git/objects/6a/507f5481c1bee061da1564c99b939e3806a725": "82b70d91322fc471f2e34a6ec2a8288c",
".git/objects/71/71e27eefd147610ad5ec6ad6f229664668c057": "34fdc46dfc2bd464526620f4c94a4c92",
".git/objects/76/00de59e70a58ae595b5637195e0fca4955da27": "a1b9f574f139b516bc66ebfa535a5c39",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/7a/690e22bb372452b81606f67f0e12f8dd79a3c6": "ef00ea9cc69db0ce4187af4506eb7586",
".git/objects/88/308e834de547b36a7143bea6d42e4c56e84a95": "cb5a6eaaaf5eb1fa79c0a299b92ec120",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/2328178fd15e9616226156ca1c004be794b50f": "01be610063696c22931000f1e3bddbee",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/9d/b4c8d57b434012fd79f34d3d9f8f6006a3377e": "8802e9cb5e573abb956c4fca5188b712",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/a7/3699f1075bb96bfaaf2700d8873ffe5c471384": "217b75c4107aeaf29451ea017aa32b7b",
".git/objects/a8/beffd3ad4fe54d6cabccf83a05477d6a986cd0": "6677888e4a051c7838b5b240c09f0981",
".git/objects/ab/0e98497a51ead7821d1da35a24968ff314e50f": "557c35fe3928eb2af403d1b3926bb9ba",
".git/objects/ad/fd93c7a166c9d4857c6a8188348b1f43ef2203": "b50434a8391816b63b5919c2e6c8bae1",
".git/objects/b6/3e70ac5f57e7d2ecb5d3307a88a547484c7c85": "a220c5bc4b76f6c708d6c351c44fafdd",
".git/objects/b6/726be5ea1b8437a8f909d68dd5049563179a18": "39f47409312f0786825c84d21b2fb6a8",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b8/ec0abe3e6313f549df2442f0d06c322f777e29": "27b486146085d0a471fa5a57202ed20f",
".git/objects/c3/1ea74b417073793c018e00f811b7298d11eb7d": "3dededab7bdd817e6b4d6caaeb66fa1b",
".git/objects/c3/ab8a4015339a7a90e2b9d72e7bdc94a46f574f": "6b19923d62c2e8a585962b3383041435",
".git/objects/c4/ba3fe12bdb962cfe0fe0baff2a7aa4533954ae": "8c74e611751e90fea11fe58e49a4baac",
".git/objects/da/f3438e6c81098c7407f1738579c14e007650c4": "414a48a2eba48e509a31fd6cc5854812",
".git/objects/df/ed1d694eb40609593885491dec9ed6ea9aac39": "5ae29b81981e971a5d41908b48862fd3",
".git/objects/e3/27ec0a290d72342729ecce24a2dd384a330ff0": "40e26634e8de1c9031b2efca9ea2c323",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/e9/b3db1a99cec4ea520d1cd8d9ebee17bb063bb9": "b541264d3f617ca977ec6d8118681c9c",
".git/objects/ea/c1b7c15c821061458e9829aba9b3fdb9a473a6": "00006d2bb0ab31573c53e95cc829610d",
".git/objects/f9/a4d84ce07620b86ea9dd49e755a5a838419bc6": "b5fe87031d2683bddf40375d1e09684f",
".git/ORIG_HEAD": "8d068a3f207ab7671d45148dcc6ecddc",
".git/refs/heads/main": "3ee006b46b5e7cadfd8253e61d9ee7d2",
".git/refs/remotes/origin/main": "3ee006b46b5e7cadfd8253e61d9ee7d2",
"assets/AssetManifest.json": "b7c8645a6ed5e7a496dee56b8246631c",
"assets/assets/fi-br-apps.svg": "b04bc235aee8ef3c54b1ca1a07f45a39",
"assets/assets/fi-br-search.svg": "6477132ec9052d44d0544511af3d2181",
"assets/assets/fi-br-user.svg": "af487c5d0f0d0ec96d2c43ee4bf138be",
"assets/assets/relaxed.png": "5b515561f95bd3de438dbe45e8ff12ce",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "4a3218386f99f22f199d94ac5e139c44",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "dfa784a8bd95e18200d577d4a6355c3d",
"/": "dfa784a8bd95e18200d577d4a6355c3d",
"main.dart.js": "a5ae28e558008737d2bd463367564e3b",
"manifest.json": "216404beb2d7a3025c1ecdf6934c20d7",
"README.md": "c621b39ddf52e33c6127942a42738bf1",
"version.json": "1376605e1cee5784c679d8851a07af59"
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
