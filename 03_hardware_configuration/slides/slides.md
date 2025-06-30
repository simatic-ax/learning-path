
Agenda

| ID | Topic |
| -- | ----- |
| 00 | Introduction to the workshop |
| 01 | Introduction to AX Code IDE |
| 02 | Get started with your first AX Project |
| **03** | **Hardware Configuration** |
| 04 | Introduction to ST Programming |
| 05 | Loading and Debugging |
| 06 | OOP Elements of ST |
| 07 | Unit Testing |
| 08 | Tools for commissioning |
| 09 | Package management |


---

<header class="slide_header">
  <h2>Prerequisites</h2>
</header>

<div class="grid-two-col-eq">
  <div class="flex-col justify-center">
    <p>To get started, you need to have SIMATIC AX, apax and all its prerequisites installed.</p>
    <p>In addition you should know the basics on how to use AX Code as well as have a starting project and know the basics of hardware configuration.</p>
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
            <li>Basic knowledge over hardware configuration</li>
            <li>Know how to insert hardware devices in project</li>
            <li>Using templates in hardware context</li>
            <li>Able to administrate Users over User Managment</li>
            <li>Hardware basic setting assignment</li>
            <li>Diagnostics in the hardware environment</li>
        </ul>
    <br>
  </div>
</div>

---

<header class="slide_header">
    <h2>IT Like Hardware Engineer</h2>
    <h3>The description of the configuration</h3>
</header>

<div class="grid-two-col-eq">
    <div class="flex-col justify-center">
        <p>
        In order to be able to create hardware for a plc, the first step we need to take is how the hardware configuration is described in a textual declaration for a IT like context.</p>
        <br>
            <p>The format in which the hardware configuration is created is Json. Json has the following advantages as a format:
                <ul>
                    <li>text based</li>
                    <li>readable by humans</li>
                    <li>can be easily edited with a text editor</li>
                </ul>
            </p>
        <br>
        <p>The devices and dependent modules, including all properties, can be easily defined and set.</p>
    </div>
    <img style="height: 400px; width: auto" src="./img/hwl-json-file.png" />
</div>

<div class="grid-slide-ressources">
    <ol>
      <li>Definition of JSON: <br><a href="https://ecma-international.org/publications-and-standards/standards/ecma-404/">ECMA-404</a></li>
    </ol>
</div>

---

<header class="slide_header">
    <h2>IT Like Hardware Engineer</h2>
    <h3>Create a hardware configuration</h3>
</header>

<div class="grid-two-col-eq">
    <div class="flex-col justify-center">
        <p>
       To create your own hardware configuration, you just have to create a file with the ending ".hwl.sjon" or you can simply use the template that is provided via the hardware laguage server.
       </p>
        <br>
            <p>There are a few points here that need to be taken into account:
                <ul>
                    <li>The entry point is always the device</li>
                    <li>The name of the device will be used later for identification. If it is changed, some things have to be initialized again.</li>
                    <li>A piece of hardware can consist of several files</li>
                </ul>
            </p>
        <br>
    </div>
    <img style="height: 400px; width: auto" src="./img/create-hardware-file.png" />
</div>

<div class="grid-slide-ressources">
    <ol>
      <li>Definition of: <br><a href="https://console.simatic-ax.siemens.io/docs/hw/language">The SIMATIC AX Hardware Declaration Language</a></li>
    </ol>
</div>

---

<header class="slide_header">
    <h2>IT Like Hardware Engineer</h2>
    <h3>Security by default</h3>
</header>

  <div class="flex-col justify-center">
     <p>Like all Siemens software, Simatic Ax also represents the principle of "Security by default". 
        Accordingly, the security aspects must be set up in the project before loading the PLC.</p>
    <br>
       <p>Security consists of two aspects: Authentication and Authorization:
          <ul>
              <li>Authentication ensures that you are communicating with the expected PLC</li>
              <li>Authorization ensures operations are only performed by users permitted to do so.</li>
          </ul>
       </p>
    <br>
  </div>

<img style="height: auto; width: auto" src="./img/securityPrinciples.png" />

<div class="grid-slide-ressources">
    <ol>
      <li>Informations about: <br><a href="https://console.simatic-ax.siemens.io/docs/hw/security">Security</a></li>
    </ol>
</div>

----

<header class="slide_header">
    <h3>Set Up PLC Security Configuration</h3>
</header>

<div class="grid-two-col-eq">
    <div class="flex-col justify-center">
        <p>
        In order to be able to create hardware for a plc, the first step we need to take is how the hardware configuration is described in a textual declaration for a IT like context.</p>
        <br>
            <p>Security consists of two aspects: Authentication and Authorization:
                <ul>
                    <li>Authentication ensures that you are communicating with the expected PLC</li>
                    <li>Authorization ensures operations are only performed by users permitted to do so.</li>
                </ul>
            </p>
        <br>
        <p>The devices and dependent modules, including all properties, can be easily defined and set.</p>
    </div>
    <img style="height: 400px; width: auto" src="./img/hwl-json-file.png" />
</div>

<div class="grid-slide-ressources">
    <ol>
      <li>Informations about: <br><a href="https://console.simatic-ax.siemens.io/docs/hw/security/authorization/plc-configuration-data-protection">PLC Configuration Data Protection</a></li>
    </ol>
</div>

----

<header class="slide_header">
    <h3>Set Up PLC Access Protection</h3>
</header>

<div class="grid-two-col-eq">
    <div class="flex-col justify-center">
        <p>
        In order to be able to create hardware for a plc, the first step we need to take is how the hardware configuration is described in a textual declaration for a IT like context.</p>
        <br>
            <p>Security consists of two aspects: Authentication and Authorization:
                <ul>
                    <li>Authentication ensures that you are communicating with the expected PLC</li>
                    <li>Authorization ensures operations are only performed by users permitted to do so.</li>
                </ul>
            </p>
        <br>
        <p>The devices and dependent modules, including all properties, can be easily defined and set.</p>
    </div>
    <img style="height: 400px; width: auto" src="./img/hwl-json-file.png" />
</div>

<div class="grid-slide-ressources">
    <ol>
      <li>Informations about: <br><a href="https://console.simatic-ax.siemens.io/docs/hw/security/authorization/plc-access-protection">PLC Access Protection</a></li>
    </ol>
</div>

---

<header class="slide_header">
    <h2>IT Like Hardware Engineer</h2>
    <h3>Using of Templates</h3>
</header>

<div class="grid-two-col-eq">
    <div class="flex-col justify-center">
        <p>
        In order to be able to create hardware for a plc, the first step we need to take is how the hardware configuration is described in a textual declaration for a IT like context.</p>
        <br>
            <p>The format in which the hardware configuration is created is Json. Json has the following advantages as a format:
                <ul>
                    <li>text based</li>
                    <li>readable by humans</li>
                    <li>can be easily edited with a text editor</li>
                </ul>
            </p>
        <br>
        <p>The devices and dependent modules, including all properties, can be easily defined and set.</p>
    </div>
    <img style="height: 400px; width: auto" src="./img/hwl-json-file.png" />
</div>

<div class="grid-slide-ressources">
    <ol>
      <li>More informations about: <br><a href="https://console.simatic-ax.siemens.io/docs/hw/language/templates">Templates</a></li>
    </ol>
</div>

---

<header class="slide_header">
    <h2>IT Like Hardware Engineer</h2>
    <h3>Integration of GSDMLs</h3>
</header>

<div class="grid-two-col-eq">
    <div class="flex-col justify-center">
        <p>
        In order to be able to create hardware for a plc, the first step we need to take is how the hardware configuration is described in a textual declaration for a IT like context.</p>
        <br>
            <p>The format in which the hardware configuration is created is Json. Json has the following advantages as a format:
                <ul>
                    <li>text based</li>
                    <li>readable by humans</li>
                    <li>can be easily edited with a text editor</li>
                </ul>
            </p>
        <br>
        <p>The devices and dependent modules, including all properties, can be easily defined and set.</p>
    </div>
    <img style="height: 400px; width: auto" src="./img/hwl-json-file.png" />
</div>

<div class="grid-slide-ressources">
    <ol>
      <li>More informations about: <br><a href="https://console.simatic-ax.siemens.io/docs/hw/language/gsd-devices-and-modules">GSDMLs in AX</a></li>
    </ol>
</div>

---


<header class="slide_header">
    <h2>IT Like Hardware Engineer</h2>
    <h3>User Managment</h3>
</header>

<div class="grid-two-col-eq">
    <div class="flex-col justify-center">
        <p>
        In order to be able to create hardware for a plc, the first step we need to take is how the hardware configuration is described in a textual declaration for a IT like context.</p>
        <br>
            <p>The format in which the hardware configuration is created is Json. Json has the following advantages as a format:
                <ul>
                    <li>text based</li>
                    <li>readable by humans</li>
                    <li>can be easily edited with a text editor</li>
                </ul>
            </p>
        <br>
        <p>The devices and dependent modules, including all properties, can be easily defined and set.</p>
    </div>
    <img style="height: 400px; width: auto" src="./img/hwl-json-file.png" />
</div>

<div class="grid-slide-ressources">
    <ol>
      <li>More informations about: <br><a href="https://console.simatic-ax.siemens.io/docs/hw/security/authorization/user-management">User Management Access Control (UMAC)</a></li>
    </ol>
</div>


---

What did you learn