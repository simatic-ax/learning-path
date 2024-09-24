---
title: Loading and Debugging
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
| **03** | **Loading and Debugging** |
| 04 | Introduction to ST Programming |
| 05 | OOP Elements of ST |
| 06 | Unit Testing |
| 07 | Tools for commissioning |
| 08 | Package management |
| 09 | Hardware Configuration |

---

<header class="slide_header">
  <h2>Prerequisites</h2>
</header>

<div class="grid-two-col-eq">
  <div class="flex-col justify-center">
    <p>To get started, you need to have SIMATIC AX, apax and all its prerequisites installed. </p>
    <p>In addition you should know the basics on how to use AX Code as well as have a starting project, that has been created in the last section
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
            <li>understand how the download workflow together with TIA Portal and AX is working.</li>
            <li>know how to download a compiled AX project to a controller.</li>
            <li>know how to debug and monitor your code online on the PLC.</li>
        </ul>
    <br>
  </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Introduction to TIAX</h2>
        <h3>Direct Loading Workflow</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Before we can download to the PLC we first need to understand, how the different parts of the PLC program are loaded.</p>
    <br>
    <p>Currently the PLC configuration is loaded by TIA Portal. Here we can load:
        <ul>
            <li>Hardware configuration</li>
            <li>Technology objects</li>
            <li>IPO OBs (Pre/Post Servo, Interpolator)</li>
        </ul>
    </p>
    <br>
    <p>After that AX can download all of our user program without overwriting the configuration done by TIA Portal.<p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/tiaxDirectLoading.png); background-repeat: no-repeat; background-size: contain">
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>TIAX Direct Loading: <br><a href="https://console.simatic-ax.siemens.io/docs/sld/tiax-direct-load">https://console.simatic-ax.siemens.io/docs/sld/tiax-direct-load</a></li>
    </ol>
  </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Introduction to TIAX</h2>
        <h3>Restrictions of the workflow</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Currently there are some things that you can't do:</p>
    <br>
    <ul>
        <li>Download software from TIA Portal</li>
        <li>Download safety program from TIA Portal</li>
        <li>Upload software downloaded by AX in TIA Portal</li>
    </ul>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/tiaxDirectLoading.png); background-repeat: no-repeat; background-size: contain">
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>Restrictions of TIAX Direct Loading: <br><a href="https://console.simatic-ax.siemens.io/docs/sld/tiax-direct-load#restrictions-and-special-issues">https://console.simatic-ax.siemens.io/docs/sld/tiax-direct-load#restrictions-and-special-issues</a></li>
    </ol>
  </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Downloading the program</h2>
        <h3>Hardware configuration from AX</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>In the assets/ax directory you can find a prepared hardware configuration, created by the AX hardware configuration.</p>
    <p>You can use PLCSim Advanced or a real PLC to test the download.</p>
    <br>
    <p>To download simply enter the command to the right. If you used the AX configuration, make sure to use the <code>certificateForConnection.crt</code> that you can find in the assets folder.</p>
    <code></code>
  </div>
  <div class="grid-slide-image">
    <pre><code>apax hwld 
    -i .\assets\AX 
    -t [YourPlcIpAddress]
    -M [YourMasterPassword]
    --accept-security-disclaimer </code></pre>
  </div>
</div>

----

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Downloading the program</h2>
        <h3>Hardware configuration from TIA Portal</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>In the assets/tia directory you can find a prepared TIA Portal V19 project that can be used to download the base hardware.</p>
    <p>You can use PLCSim Advanced or a real PLC to test the download.</p>
    <br>
    <p>To download follow these steps:</p>
    <ol>
        <li>Right click on the PLC</li>
        <li>Select <code>Download to device</code></li>
        <li>Select <code>Hardware configuration</code></li>
        <li>Choose the interface and PLC you want to download to</li>
    </ol>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/DownloadHardwareTia.gif); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

----

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Downloading the program</h2>
        <h3>Export PLC certificate</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>If you are using secure communication between the PLC and the engineering system, you first have to export the certificate of the PLC.</p>
    <br>
    <p>Follow these steps after downloading the Hardware configuration:</p>
    <ol>
        <li>Select the PLC</li>
        <li>Got to Properties &rarr; <code class="selection">Protection and Security</code></li>
        <li>Scroll to the section <code class="selection">Device certificates</code></li>
        <li>Right click on the certificate for Communication and select <code class="selection">Export certificate</code></li>
    </ol>
    <div class="warning">When you downloaded from TIA Portal, the assets/certificateForConnection.crt is <strong>NOT</strong> valid</div>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/ExportCertificate.gif); background-repeat: no-repeat; background-size: contain">
  </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Downloading the program</h2>
        <h3>User program</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>After the hardware configuration has been downloaded, you can use AX to download the software</p>
    <br>
    <p>
    This will invoke the <code>sld</code> (software loader) and download the target specific binary to the device reachable under the set PLC IP Address. If you have set up secure communication in TIA Portal (activated by default) you also need to set the path to the certificate of the PLC.
    </p>

  </div>
  <div class="grid-slide-image">
    <div>
    <pre><code data-noescape data-trim>
    apax sld load --target [PLC Address] 
                  --certificate [certificate.cer]
                  --input [./bin/1500]
    </code></pre>
    <br>
    <table class="reference">
        <tr>
            <td>PLC Address</td>
            <td>IP or DNS Address of the PLC you want to download to</td>
        </tr>
        <tr>
            <td>certificate.cer</td>
            <td>Path to the certificate of the PLC exported by TIA Portal</td>
        </tr>
        <tr>
            <td>./bin/1500</td>
            <td>Path to the binary for the target you want to load to, if ommitted this defaults to bin/1500</td>
        </tr>
    </table>
    </div>
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>sld CLI reference: <br><a href="https://console.simatic-ax.siemens.io/docs/sld/cli-reference">https://console.simatic-ax.siemens.io/docs/sld/cli-reference</a></li>
    </ol>
  </div>
</div>
---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Downloading the program</h2>
        <h3>Problems reaching the PLC</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>If you can not reach the PLC, you might have to adjust the routing in your network configuration.</p>
    <br>
     <p>Go to your windows Control Panel:</p>
    <ol>
        <li>Select <code class="selection">Set PG/PC Interface</code></li>
        <li>In the Access Path section select <code>S7ONLINE (Step 7)</code> option of the dropdown</li>
        <li>Select the Network Card you are using to connect to the PLC</code></li>
    </ol>
  </div>
<div class="grid-slide-image" style="background-image: url(../img/PGPCInterface.gif); background-repeat: no-repeat; background-size: contain">
  </div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Online monitoring of variables</h2>
        <h3>Preparation of the project</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Currently your project is empty and therefore there is nothing to see when going online.</p>
    <br>
     <p>Let's add some basic code to our program.st</p>
    <ol>
        <li>In the <code>VAR</code> section add:</li>
        <pre>
        VAR
          counter : INT;
        END_VAR
        </pre>
        <li>Then increment the counter every time this program is called:</li>
        <pre>
        counter := counter + 1;
        </pre>
    </ol>
  </div>
  <div class="grid-slide-image">
        <i>Source of the program.st</i>
        <br>
        <br>
        <pre>
        PROGRAM MyProgram
        <br>
        VAR
            counter : INT;
        END_VAR
        <br>
        counter := counter + 1;
        <br>
        END_PROGRAM
        </pre>
  </div>

---


<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Online monitoring of variables</h2>
        <h3>Download new project</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>After changing anything in your source code your have to rebuild and download to the PLC; you can refer to the <a href="#7">previous slide</a></p>
    <br>
     <p>In addition you have to tell the compiler to include the debug symbols into the binary. This can be done by setting a build argument in the apax.yml before building the project</p>
  </div>
  <div class="grid-slide-image">
        <pre><code data-noescape data-trim data-line-numbers="7-9">
        name: "test"
        version: 0.0.0
        type: app
        targets:
          - "1500"
          - llvm
        variables:
          APAX_BUILD_ARGS:
            - "--debug"
        </code></pre>
  </div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Online monitoring of variables</h2>
        <h3>Configure online access</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>To go online we first must configure where to connect to; this can be done in the file <code>.vscode/launch.json</code></p>
    <br>
    <p>You can either create it manually or select the Run and Debug menu (<code class="selection">Ctrl+Shift+D</code>) and click on the "create a launch.json file".</p>
    <p>Then you can fill in the correct IP Address and path to the certificate.</p>
    <div class="definition">
      The ${workspaceFolder} is a AX Code variable and refers to the root of your project. It is the same folder where the apax.yml is located in. 
    </div>
  </div>
  <div class="grid-slide-image">
       <pre><code data-noescape data-trim>
        {
        "version": "0.2.0",
        "configurations": [
            { 
            "name": "Debug live on PLC",
            "type": "plc-debug",
            "request": "launch",
            "program": "${workspaceFolder}",
            "ip": "192.168.0.1",
            "certificate": "${workspaceFolder}/test.cer"
            }
          ]
        }
        </code></pre>
  </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Online monitoring of variables</h2>
        <h3>Going online with logpoints</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>Now that we have set up all the prerequisites, we can finally go online and monitor our variables!</p>
    <br>
    <p>There are multiple ways to see the actual online values of variables, the first we will see is using logpoints with the sdb. To start the debugger, click on the <img src="./img/sdb_start.png"> icon.</p>
    <br>
    <p>Right-click on a line of code and select <code class="selection">Add to logpoint</code></p>
    <p>A logpoint will print the value any time that the line of code is executed</p>  

  </div>
  <div class="grid-slide-image" style="background-image: url(../img/sdb_logpoint.gif); background-repeat: no-repeat; background-size: contain"></div>
  <div class="grid-slide-ressources">
    <ol>
      <li>sdb Logpoints Limitation: <br><a href="https://console.simatic-ax.siemens.io/docs/plc-debugging/sdb/limitations">https://console.simatic-ax.siemens.io/docs/plc-debugging/sdb/limitations</a></li>
    </ol>
  </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Online monitoring of variables</h2>
        <h3>Going online with watchtables</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>An alternative to logpoints is to use watchtables/ the mon-tool. To do this we create a new file with a .mon file extension. In our example you can add:</p>
    <br>
    <pre>P1.counter</pre>
    <p>To start the mon tool click on the <img src="./img/sdb_start.png"> icon.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/watchtable.gif); background-repeat: no-repeat; background-size: contain"></div>
  <div class="grid-slide-ressources">
    <ol>
      <li>mon Monitor File: <br><a href="https://console.simatic-ax.siemens.io/docs/plc-debugging/mon/example#monitor-file">https://console.simatic-ax.siemens.io/docs/plc-debugging/mon/example#monitor-file</a></li>
    </ol>
  </div>
</div>

---


<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Online monitoring of variables</h2>
        <h3>Modifying values</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>If we want to control and test our program we also want to modify values. This can be done with the mod tool.</p>
    <br>
    <p>You can modify modify global or static variables with this command:</p>
  </div>
  <div class="grid-slide-image">
  <div>
    <pre>
    apax mod --target [PLC Address]
             --certificate [certificate.cer]
             --symbol [P1.counter] 
             --value [0]
    </pre>
    <br>
    <table class="reference">
        <tr>
            <td>PLC Address</td>
            <td>IP or DNS Address of the PLC you want to download to</td>
        </tr>
        <tr>
            <td>certificate.cer</td>
            <td>Path to the certificate of the PLC exported by TIA Portal</td>
        </tr>
        <tr>
            <td>P1.counter</td>
            <td>Symbolic name of the variable you want to modify</td>
        </tr>
        <tr>
            <td>0</td>
            <td>Value you want to assign to the variable</td>
        </tr>
    </table>
    </div>
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>mod: <br><a href="https://console.simatic-ax.siemens.io/docs/plc-debugging/mod">https://console.simatic-ax.siemens.io/docs/plc-debugging/mod</a></li>
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
      <li>how to download you machine program to the PLC</li>
      <li>how to go online and monitor variables</li>
      <li>how to modify variables on the PLC</li>
    </ul>
    <br>
  </div>
</div>
