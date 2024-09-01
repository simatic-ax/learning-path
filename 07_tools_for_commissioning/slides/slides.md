---
title: Tools for commissioning
progress: true
revealOptions:
  transition: 'fade'
mouseWheel: true,
---

# Agenda

| ID | Topic |
| -- | ----- |
| 00 | Introduction to the workshop |
| 01 | Introduction to AX Code IDE |
| 02 | Get started with your first AX Project |
| 03 | Loading and Debugging |
| 04 | Introduction to ST Programming |
| 05 | OOP Elements of ST |
| 06 | Unit Testing |
| **07** | **Tools for commissioning** |
| 08 | Package management |

---

<header class="slide_header">
  <h2>Prerequisites</h2>
</header>

<div class="grid-two-col-eq">
  <div class="flex-col justify-center">
    <p>To get started, you need to have SIMATIC AX, apax and all its prerequisites installed. </p>
    <p>In addition you should know the basics on how to use AX Code as well as have a starting project, that has been created in the previouse section
    </p>
    <br/>
    <p>With this you are set up to continue with this learning path.</p>
  </div>
</div>
---
<header class="slide_header">
  <h2>
        What will you learn in this chapter
  </h2>
</header>
<div class="grid-two-col-eq">
  <div class="flex-col justify-center">
    <p>After you completed this training section you will </p>
        <ul>
            <li>know about different utilities and tools you can use while commissioning.</li>
            <li>know how to diagnose hardware and PLC issues.</li>
        </ul>
    <br>
  </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Local Connection Setup</h2>
        <h2>PLC-Browser</h2>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Most of the tools discussed in this section need to go online to the PLC to display information that is important during commissioning. To do this, we can discover PLCs in our network using the PLC Browser tool. First you need to add the dcp Utility tool with <code>apax add --dev @ax/dcp-utility</code> to your project.</p>
    <br>
    <p>Then you can call the tool using the command palette (<code class="selection">F1</code>) and select the network interface you want to scan on; selecting a PLC will add it to the local connection configuration.
    </p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/plc-browser.gif); background-repeat: no-repeat; background-size: contain">
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>dcp-utility: <br><a href="https://console.simatic-ax.siemens.io/docs/dcp-utility">https://console.simatic-ax.siemens.io/docs/dcp-utility</a></li>
      <li>PLC Browser: <br><a href="https://console.simatic-ax.siemens.io/docs/axcode/plc-browser">https://console.simatic-ax.siemens.io/docs/axcode/plc-browser</a></li>
    </ol>
  </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Local Connection Setup</h2>
        <h2>Manual</h2>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Alternatively you can configure the PLC connection manually with the following steps:</p>
    <br>
        <ol>
            <li>Create a <code>plc.yaml</code> in the <code>.ax/plcs/</code> directory</li>
            <li>Enter the specific informations of the PLC</li>
        </ol>
    </p>
    <br>
    <p>With this you are set to continue to the commissioning tools.<p>
  </div>
  <div class="grid-slide-image">
    <pre><code data-noescape data-trim>
    host: PLC_IP_ADDRESS
    certificate: PATH_TO_PLC_CERTIFICATE
    displayName: CUSTOM_NAME
    </code></pre>
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>Local Connection Config: <br><a href="https://console.simatic-ax.siemens.io/docs/local-connection-config">https://console.simatic-ax.siemens.io/docs/local-connection-config</a></li>
    </ol>
  </div>
</div>


---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Diagnostics Buffer</h2>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Any alarms present in the PLC can be found in the diagnostics buffer of the PLC. This buffer can be read using the <code class="selection">diagnostic-buffer tool</code></p>
    <br>
    <p>To call the tool, you can either right-click on the <code>.ax/plcs/PLC.yaml</code> file and select <code class="selection">Online Diagnostics</code> or you can search for Diagnostics Buffer in the Command Palette
    </p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/DiagBuffPanelWeb.png); background-repeat: no-repeat; background-size: contain">
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>Diagnostic Buffer: <br><a href="https://console.simatic-ax.siemens.io/docs/axcode/diagnostic-buffer">https://console.simatic-ax.siemens.io/docs/axcode/diagnostic-buffer</a></li>
    </ol>
  </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>PLC Performance Info</h2>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>To get more information about the cycle time and used performance on the PLC you are working on you can use the <code class="selection">PLC Performance Info Tool</code></p>
    <br>
    <p>To call the tool, you can either right-click on the <code>.ax/plcs/PLC.yaml</code> file and select <code class="selection">Online Diagnostics</code> or you can search for PLC Performance Info in the Command Palette
    </p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/PerformanceInfo.png); background-repeat: no-repeat; background-size: contain">
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>Performance Info: <br><a href="https://console.simatic-ax.siemens.io/docs/axcode/performance-info">https://console.simatic-ax.siemens.io/docs/axcode/performance-info</a></li>
    </ol>
  </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>PLC Online Hub</h2>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>To get more information about the PLC in general (identifying information, firmware, run state etc.) you can use the online hub.</p>
    <br>
    <p>To call the tool, you can either right-click on the <code>.ax/plcs/PLC.yaml</code> file and select <code class="selection">Launch PLC Online Hub</code> or you can search for Online Hub in the Command Palette
    </p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/PlcOnlineHub.png); background-repeat: no-repeat; background-size: contain">
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>PLC Online Hub: <br><a href="https://console.simatic-ax.siemens.io/docs/axcode/plc-online-hub">https://console.simatic-ax.siemens.io/docs/axcode/plc-online-hub</a></li>
    </ol>
  </div>
</div>

---

<header class="slide_header">
  <h2>
        What did you learn
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>In this section you learned about...</p>
    <ul>
      <li>how to configure the connection to PLCs in the network.</li>
      <li>how you can use AX Code to diagnose issues on the PLC.</li>
      <li>different tools available at your disposal to succeed at commissioning.</li>
    </ul>
    <br>
  </div>
</div>

