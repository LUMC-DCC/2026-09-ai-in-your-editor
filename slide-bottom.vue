<template>
  <footer class="slidev-footer">
    <!-- Left: logos -->
    <div class="footer-logos">
      <img src="/img/lumc-logo-blauw-engels.png" alt="LUMC" class="footer-logo" />
      <div class="footer-divider" />
      <img src="/img/Logo.png" alt="Coding Café" class="footer-logo" />
    </div>

    <!-- Center: title -->
    <div class="footer-title">
      LUMC DCC Coding Café · 8 September 2026
    </div>

    <!-- Right: slide number -->
    <div class="footer-pager">
      {{ $slidev.nav.currentPage }}<span class="footer-pager-sep">/</span>{{ $slidev.nav.total }}
    </div>
  </footer>
</template>

<style scoped>
.slidev-footer {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 24px;
  background: white;
  border-top: 2px solid #003c7d;
  z-index: 20;
}

.footer-logos {
  display: flex;
  align-items: center;
  gap: 10px;
}

.footer-logo {
  height: 20px;
  object-fit: contain;
  opacity: 0.85;
}

.footer-divider {
  width: 1px;
  height: 16px;
  background: #cbd5e1;
}

.footer-title {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  font-size: 11px;
  font-weight: 500;
  color: #64748b;
  letter-spacing: 0.02em;
  white-space: nowrap;
}

.footer-pager {
  font-size: 11px;
  font-weight: 600;
  color: #003c7d;
  font-variant-numeric: tabular-nums;
  letter-spacing: 0.02em;
}

.footer-pager-sep {
  color: #94a3b8;
  margin: 0 2px;
  font-weight: 400;
}
</style>
