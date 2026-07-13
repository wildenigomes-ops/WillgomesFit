// Service Worker do Portal WillgomesFit
// Objetivo: permitir que o Android/Chrome ofereça "Instalar app" automaticamente
// e dar um cache básico para abrir mais rápido nas próximas vezes.

const CACHE_NAME = 'willgomesfit-portal-v3';
const CORE_ASSETS = [
  './portal.html',
  './manifest.json',
  './icon-192.png',
  './icon-512.png'
];

self.addEventListener('install', (event) => {
  self.skipWaiting();
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => cache.addAll(CORE_ASSETS)).catch(() => {})
  );
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((names) =>
      Promise.all(names.filter((n) => n !== CACHE_NAME).map((n) => caches.delete(n)))
    )
  );
  self.clients.claim();
});

// Estratégia: network-first para tudo, ignorando qualquer cache HTTP do navegador
// (não só o Cache API) — importante pro app instalado sempre buscar a versão mais
// nova ao abrir, em vez de confiar em uma resposta guardada.
self.addEventListener('fetch', (event) => {
  if (event.request.method !== 'GET') return;

  event.respondWith(
    fetch(event.request, { cache: 'no-store' })
      .then((response) => {
        const copy = response.clone();
        caches.open(CACHE_NAME).then((cache) => cache.put(event.request, copy)).catch(() => {});
        return response;
      })
      .catch(() => caches.match(event.request))
  );
});
