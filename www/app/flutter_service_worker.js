'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "871302f86884a63f5b953750aed6acff",
"flutter.js": "0816e65a103ba8ba51b174eeeeb2cb67",
"index.html": "68cca25a89a955c44f87f0486bbc005b",
"/": "68cca25a89a955c44f87f0486bbc005b",
"main.dart.js": "f98731b23983a6018e1ad16b81a97802",
"splash/img/light-1x.png": "0edf1b586041ed105e06412621a6e8c9",
"splash/img/light-4x.png": "e6621b1d249fe2be109e3af6ebb062aa",
"splash/img/light-2x.png": "c827ff0ce7aae721905bf680899830bb",
"splash/img/dark-2x.png": "c827ff0ce7aae721905bf680899830bb",
"splash/img/dark-3x.png": "90b021837a58e8c23e48e17f00171483",
"splash/img/light-3x.png": "90b021837a58e8c23e48e17f00171483",
"splash/img/dark-1x.png": "0edf1b586041ed105e06412621a6e8c9",
"splash/img/dark-4x.png": "e6621b1d249fe2be109e3af6ebb062aa",
"splash/splash.js": "c6a271349a0cd249bdb6d3c4d12f5dcf",
"splash/style.css": "92f754e1dbf348e139d79abeaf4b2012",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "adc35b794f8562c8fde1b9bf37783804",
"assets/AssetManifest.json": "09542708532c931676cbc0b1f2bb7012",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/assets/data/information.html": "376974db44cc5e04668085df6762a2e2",
"assets/assets/icons/app_logo_white_bg.png": "6d2f07555d79fc81ff26f90f94b297c5",
"assets/assets/icons/app_logo_512.png": "2e0329726c7805d7e656e1f867dbcdb2",
"assets/assets/icons/app_logo_1024.png": "31c5db56ca6ffd855563d7e4244053dc",
"assets/assets/guidelines/congenital_heart_disease.yaml": "3e211d05c5c0d8018a8fd7ed0d82c626",
"assets/assets/guidelines/cardiac_arrest.yaml": "d4b7e5c929571d9c2042eae0c5929a47",
"assets/assets/guidelines/dilated_cardiomyopathy.yaml": "4ee20b489d06e2f3a95075adb0191efe",
"assets/assets/guidelines/diplopia.yaml": "0b737eb4efbc9e4b9e628796a726c26b",
"assets/assets/guidelines/ecg_abnormalities.yaml": "3750f513c4b40471381e13261ab0bd21",
"assets/assets/guidelines/ventricular_assist_device.yaml": "4d9a443f1716ac4cbf18e52884b6684c",
"assets/assets/guidelines/valvular_heart_disease.yaml": "505717652921cbafad2b6e262f521027",
"assets/assets/guidelines/diabetes_mellitus_non_insulin.yaml": "557e0d7f2596def3e5b11cedc2852b6c",
"assets/assets/guidelines/permanent_pacemaker.yaml": "3ec8c58af64515ff3e4fda16e62d8806",
"assets/assets/guidelines/visual_fields.yaml": "1dd931c9c19c3b63de6209d237210326",
"assets/assets/guidelines/percutaneous_coronary_intervention.yaml": "dbd005194c9061f2fab995326be187bb",
"assets/assets/guidelines/cardiac_arrhythmias.yaml": "9d9d20b0ca5bfd6d4306744ba71896ef",
"assets/assets/guidelines/myocardial_infarction.yaml": "0ce63930c1665cb3045122bb4c2b1c1d",
"assets/assets/guidelines/implantable_cardiac_defibrillator.yaml": "0081dae32f65ad4f7844952e310516c4",
"assets/assets/guidelines/sleep_apnoea.yaml": "46512e169a993675b9a73a002a20104c",
"assets/assets/guidelines/aortic_aneurysm.yaml": "0097975e92066ccc3b73a4e1a246771c",
"assets/assets/guidelines/coronary_artery_bypass_grafting.yaml": "62dc8c3ac951520a4bb67d4dcf0c8581",
"assets/assets/guidelines/angina.yaml": "d3d0949c40d1dfc164c2335a8f6c406e",
"assets/assets/guidelines/deep_vein_thrombosis.yaml": "4f8b4f535796f91a3c1bde6e8d1ca269",
"assets/assets/guidelines/index.json": "13e94d2ab008e4b82d495fded62d1726",
"assets/assets/guidelines/psychiatric.yaml": "59d73eef2506a0072d6a39381ec3f575",
"assets/assets/guidelines/anticoagulation.yaml": "a4fac2538c63be96431e42a1fe462063",
"assets/assets/guidelines/vasovagal_syncope.yaml": "95afea5ecf70a55f514cc481399a6c97",
"assets/assets/guidelines/hearing_loss.yaml": "a55cd389b9035531c6d0bf20066f532c",
"assets/assets/guidelines/syncope_with_unknown_cause.yaml": "66c0380020f8deb7cd22f34164a1a945",
"assets/assets/guidelines/hypertension.yaml": "e696384f351e9367a19aa59f35c84ade",
"assets/assets/guidelines/hypertrophic_cardiomyopathy.yaml": "826e3dbddb59551d1363ac968ac4b77d",
"assets/assets/guidelines/narcolepsy.yaml": "cdf55bffd6ef964be32e3769a6d9d95f",
"assets/assets/guidelines/musculoskeletal.yaml": "c0804e6b9363293a1df8c3969cd3fce4",
"assets/assets/guidelines/pulmonary_embolism.yaml": "99876583295c0c58f57ad0480b57e76f",
"assets/assets/guidelines/heart_transplant.yaml": "662c730bc732bf84e16eb5ba47ae945a",
"assets/assets/guidelines/substance_abuse.yaml": "c4988dcfcfd688e62f7e14f75c5b5f68",
"assets/assets/guidelines/visual_acuity.yaml": "f23d182ecbf60c5ee720bddb702809a8",
"assets/assets/guidelines/diabetes_mellitus_insulin.yaml": "1f40b8b1e28b68cbccb939c790de1491",
"assets/assets/guidelines/diabetes_mellitus_lifestyle.yaml": "a1304ffba0c0b0ccf46af66adb679eff",
"assets/assets/guidelines/monocular_vision.yaml": "4be04d46d1984cbb80a088266e6e56e9",
"assets/assets/guidelines/atrial_fibrillation.yaml": "8aa325e18bc1f750e35819770c431f29",
"assets/assets/guidelines/cardiac_syncope.yaml": "ba8a0cd7708c459ec7f895f6ca6873c9",
"assets/assets/guidelines/heart_failure.yaml": "ed5a5c36c6bd2031e8051f34aa258bb3",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"manifest.json": "e37215626bf4c3b94862354aca3264d2",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
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
