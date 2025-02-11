---
title: Introduction to the SIMATIC AX Code IDE 
progress: true
revealOptions:
  transition: 'fade'
mouseWheel: true,
---

# Agenda

|  |  |
| -- | ----- |
| 00 | Introduction to the workshop |
| **01** | **Introduction to the SIMATIC AX Code IDE** |
| 02 | Get started with your first AX Project |
| 03 | Loading and Debugging |
| 04 | Introduction to ST Programming |
| 05 | OOP Elements of ST |
| 06 | Unit Testing |
| 07 | Tools for commissioning |
| 08 | Package management |
| 09 | Versioning and Continuous Integration |

---

<header class="slide_header">
  <h2>Prerequisites</h2>
</header>

<div class="grid-two-col-eq">
  <div class="flex-col justify-center">
    <p>To get started, you need to have SIMATIC AX, apax and all its prerequisites installed. To get access to the software you need a SiemensID account and a license for SIMATIC AX.</p>
        <ul>
            <li><a href="https://console.simatic-ax.siemens.io/docs/get-started/prerequisites">Prerequisites for installing SIMATIC AX</a></li>
            <li><a href="https://console.simatic-ax.siemens.io/downloads">Download and install SIMATIC AX</a></li>
        </ul>
    <br>
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
            <li>have a rough overview about the SIMATIC AX Code IDE</li>
            <li>have learned about:</li>
            <ul>
                <li>using the terminal</li>
                <li>Built-In and AX Extensions</li>
                <li>window handling and editor customization</li>
            </ul>
        </ul>
    <br>
  </div>
</div>

---

<header class="slide_header">
  <h2>
        SIMATIC AX Code IDE
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>SIMATIC AX Code is an IDE based on Visual Studio Code, an immensly popular open source IDE created by Microsoft.</p>
    <p>The IDE has been enriched with Siemens specific functionality to support the user while engineering a PLC.</p>
  </div>
    <img src="./img/axcode.png" height=500 width=auto/>
</div>

---

<header class="slide_header">
  <h2>
        Built-In-Extensions
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>SIMATIC AX Code comes with a prefabricated set of extensions. Those extensions are available natively inside the IDE, e.g. GIT source control.</p>
  </div>
    <img src="./img/built-in-extensions.png" height=auto width=auto/>
</div>

---

<header class="slide_header">
  <h2>
        Open VSIX Marketplace
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>Furthermore you have access to the Open VSIX marketplace and may add your favorite extensions like GitLens.</p>
  </div>
    <img src="./img/marketplace.png" height=auto width=auto/>
</div>

---

<header class="slide_header">
  <h2>
        Extension Manager
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>Besides third-party extensions, there are also SIMATIC AX specific extensions. Those extensions are installed via the extension manager, which is integrated into SIMATIC AX Code. The extension manager can also update the installed extensions automatically (optionally).</p>
    <p>Some examples for SIMATIC AX specific extensions:</p>
    <ul>
      <li>ST (according IEC61131-3) syntax highlighting</li>
      <li>AxUnit Test Explorer</li>
      <li>PLC Explorer</li>
      <li>Apax</li>
    </ul>
  </div>
    <img src="./img/ax-extensions.png" height=auto width=auto/>
</div>

---

<header class="slide_header">
  <h2>
        Execute functionality in SIMATIC AX Code
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>While some of the functionalities of the extensions are accessible via the UI, you may access a more extended set of the functionalities via the command palette. To access them press <code>F1</code> or <code>Ctrl + Shift + P</code></p>
    <p>Here you can search for the functionality you require.</p>
  </div>
    <img src="./img/f1command.png" height=auto width=auto/>
</div>

---

<header class="slide_header">
  <h2>
        Integrated terminal
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>The IDE provides a built-in terminal that lets you access the file system and execute CLI commands and scripts inside. You can open a new terminal via the top bar: "Terminal" > "New Terminal". </p>
  </div>
    <img src="./img/apax-build.png" height=auto width=auto/>
</div>

---

<header class="slide_header">
  <h2>
        Output window
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>To support the user in debugging extension specific behavior and errors, an output panel is available. In the output panel you can take a look at outputs of various integrated extensions. </p>
    <p>Note that the output panel is always specific to the extension selected and can be switched using the drop down menu on the right.</p>
  </div>
    <img src="./img/output.png" height=auto width=auto/>
</div>

---

<header class="slide_header">
  <h2>
        Window layout
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>You may change the current layout of the IDE to your liking. On the top right inside of SIMATIC AX Code you have the possibility to fully customize the layout of the windows.</p>
    <p>You can also drag and drop the tab of the current editor and move it to the desired location</p>
  </div>
    <img src="./img/window-customization.PNG" height=150 width=auto/>
</div>

---

<header class="slide_header">
  <h2>
        Autosaving changes
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>When editing files inside the IDE, changes are not immediately mirrored back to your file system. Unsaved changes in a file won't be considered while executing any of the functionalities inside the IDE.</p>
    <p>Hence, we recommend to always enable auto save</p>
  </div>
    <img src="./img/autosave.png" height=60% width=auto/>
</div>

---

<header class="slide_header">
  <h2>
        What did you learn
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>You learned about...</p>
    <ul>
      <li>different extensions in the IDE</li>
      <li>basic funtionalities of AX Code</li>
      <li>how to navigate and use the Editor</li>
    </ul>
  </div>
</div>
