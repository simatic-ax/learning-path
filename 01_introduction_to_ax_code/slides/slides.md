---
title: Introduction to the AX Code IDE 
progress: true
revealOptions:
  transition: 'fade'
mouseWheel: true,
---

# Agenda

|  |  |
| -- | ----- |
| 00 | Introduction to the workshop |
| **01** | **Introduction to AX Code IDE** |
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
            <li>have a rough overview about the AX Code IDE</li>
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
        AX Code IDE
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>AX Code is an IDE based on Visual Studio Code, an immensly popular open source IDE created by Microsoft.</p>
    <p>AX Code adds a lot of specific functionality, that helps you write better ST code </p>
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
    <p>There are built in extensions like the source control via git.</p>
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
    <p>Furthermore you have access to the VSIX marketplace and can add your favorite extensions like GitLens.</p>
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
    <p>Beside the custom extensions there are AX specific extensions. Those are installed via the extension manager which is integrated into AX Code. The exension manager can also update the installed extensions automatically (optionally).</p>
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
        Call functions in AX code
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>Press <code>F1</code> or <code>Ctrl + Shift + P</code> for quick access to nearly all functionalities of the AX IDE.</p>
    <p>Here you can search for the functionality you require</p>
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
    <p>You can open a new terminal via the top bar: "Terminal" > "New Terminal". </p>
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
    <p>In the output window ou can take a look at outputs of various integrated tools. </p>
    <p>Note that the output is always specific to the tools and can be switched using the drop down menu on the right.</p>
  </div>
    <img src="./img/output.png" height=auto width=auto/>
</div>

---

<header class="slide_header">
  <h2>
        Window Arrangement
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>On the top right of AX Code you have the possibility to fully customize the layout of the windows.</p>
    <p>You can also drag and drop the tab of the current editor and move it to the desired location</p>
  </div>
    <img src="./img/window-customization.PNG" height=150 width=auto/>
</div>

---

<header class="slide_header">
  <h2>
        Auto Safe
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>Recommendation: enable auto save.</p>
    <p>By default this option will be turned off and you have to manually safe the file every time you modify it. Files with unsafed modifications will be  
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
