---
title: Chrome Quantum-resistant Root Program - Test Root Store
---

# CQRP Test Root Store

Below is the list of **MTC CA Cosigners** and **Mirror Cosigners** included in the Chrome Quantum-resistant Test Root Store.

Data is fetched from [`https://www.gstatic.com/mtcs/cosigners/v1/cosigners.json`](https://www.gstatic.com/mtcs/cosigners/v1/cosigners.json).

<div id="loading-spinner" style="padding: 1.5em; font-weight: bold; color: #57606a; background: #f6f8fa; border-radius: 6px; margin: 1em 0;">
  ⏳ Loading cosigners data...
</div>

<div id="cosigners-content" style="display: none;">
  <p style="background: #e8f0fe; color: #1a73e8; padding: 0.75em 1em; border-radius: 6px; font-weight: 500;">
    <strong>Store Version:</strong> <span id="store-version">-</span> &nbsp;|&nbsp; 
    <strong>Last Updated:</strong> <span id="store-timestamp">-</span>
  </p>

  <h3>MTC CA Cosigners (Issuers)</h3>
  <table>
    <thead>
      <tr>
        <th>Friendly Name</th>
        <th>Operator</th>
        <th>Base URL</th>
        <th>Base ID</th>
        <th>Max Lifetime</th>
        <th>Key SHA-256</th>
      </tr>
    </thead>
    <tbody id="issuers-body"></tbody>
  </table>

  <h3>Mirror Cosigners</h3>
  <table>
    <thead>
      <tr>
        <th>Friendly Name</th>
        <th>Operator</th>
        <th>Base URL</th>
        <th>State</th>
        <th>Key SHA-256</th>
      </tr>
    </thead>
    <tbody id="mirrors-body"></tbody>
  </table>
</div>

<div id="error-message" style="display: none; color: #cf222e; padding: 1em; background: #ffebe9; border-radius: 6px; margin: 1em 0;">
  <strong>Failed to load data.</strong> You can view the raw JSON directly at <a href="https://www.gstatic.com/mtcs/cosigners/v1/cosigners.json" target="_blank">cosigners.json</a>.
</div>

<script>
async function loadCosigners() {
  const loading = document.getElementById("loading-spinner");
  const content = document.getElementById("cosigners-content");
  const errorMsg = document.getElementById("error-message");

  let data;
  try {
    const response = await fetch("https://www.gstatic.com/mtcs/cosigners/v1/cosigners.json");
    if (!response.ok) throw new Error("HTTP " + response.status);
    data = await response.json();
  } catch (err) {
    console.warn("Direct fetch from gstatic failed (likely CORS). Falling back to local static snapshot:", err);
    try {
      // Relative path to fallback JSON saved at build time
      const fallbackUrl = window.location.origin + "/static/cosigners_fallback.json";
      const fallbackResp = await fetch(fallbackUrl);
      if (!fallbackResp.ok) throw new Error("Fallback HTTP " + fallbackResp.status);
      data = await fallbackResp.json();
    } catch (fallbackErr) {
      console.error("Fallback fetch failed:", fallbackErr);
      loading.style.display = "none";
      errorMsg.style.display = "block";
      return;
    }
  }

  try {
    document.getElementById("store-version").textContent = data.version || "N/A";
    document.getElementById("store-timestamp").textContent = data.timestamp ? new Date(data.timestamp).toLocaleString() : "N/A";
    
    // Build Issuers table
    const issuersBody = document.getElementById("issuers-body");
    issuersBody.innerHTML = "";
    if (data.issuers && data.issuers.length > 0) {
      data.issuers.forEach(item => {
        const opName = (item.operator_history && item.operator_history.length > 0) ? item.operator_history[0].name : "Unknown";
        const lifetime = item.max_cert_lifetime_seconds ? (item.max_cert_lifetime_seconds / 86400) + " days" : "N/A";
        const tr = document.createElement("tr");
        tr.innerHTML = `
          <td><strong>${item.friendly_name || ""}</strong></td>
          <td>${opName}</td>
          <td><a href="${item.base_url}" target="_blank" rel="noopener">${item.base_url}</a></td>
          <td><code>${item.base_id || ""}</code></td>
          <td>${lifetime}</td>
          <td><code title="${item.key_sha256}">${(item.key_sha256 || "").substring(0, 12)}...</code></td>
        `;
        issuersBody.appendChild(tr);
      });
    } else {
      issuersBody.innerHTML = '<tr><td colspan="6">No issuer cosigners currently listed.</td></tr>';
    }

    // Build Mirrors table
    const mirrorsBody = document.getElementById("mirrors-body");
    mirrorsBody.innerHTML = "";
    if (data.mirrors && data.mirrors.length > 0) {
      data.mirrors.forEach(item => {
        const opName = (item.operator_history && item.operator_history.length > 0) ? item.operator_history[0].name : "Unknown";
        const state = (item.state_history && item.state_history.length > 0) ? item.state_history[0].state : "UNKNOWN";
        const tr = document.createElement("tr");
        tr.innerHTML = `
          <td><strong>${item.friendly_name || ""}</strong></td>
          <td>${opName}</td>
          <td><a href="${item.base_url}" target="_blank" rel="noopener">${item.base_url}</a></td>
          <td><span style="background: #dafbe1; color: #1a7f37; padding: 2px 6px; border-radius: 4px; font-weight: bold; font-size: 11px;">${state}</span></td>
          <td><code title="${item.key_sha256}">${(item.key_sha256 || "").substring(0, 12)}...</code></td>
        `;
        mirrorsBody.appendChild(tr);
      });
    } else {
      mirrorsBody.innerHTML = '<tr><td colspan="5">No mirror cosigners currently listed.</td></tr>';
    }

    loading.style.display = "none";
    content.style.display = "block";
  } catch (renderErr) {
    console.error("Rendering error:", renderErr);
    loading.style.display = "none";
    errorMsg.style.display = "block";
  }
}

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", loadCosigners);
} else {
  loadCosigners();
}
</script>
