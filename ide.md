<img  align="right" src="https://github.com/UCLanCSC/CSResources/blob/main/images/general/logo.jpg?raw=true" style="zoom:10%" />

# CO2404 : Cross Platform Development

### Lab : Setting up the Environment

> **Remember** labs often follow-on from the lectures. If you are stuck you should review your lecture notes, slides or recording as essential information is contained in the topics you learn week-on-week. Practical work (labs and coursework) will require you to review past lecture materials as you will be required to assimilate this knowledge over time. 

**You will need to demo work to your tutor to sign off at the end of each session**



## Summary

This lab introduces Visual Studio Code as an IDE for Flutter development. It will guide students into setting up their own cross platform programming environment. The toolchain required to getting started  and how to run code within the Android Virtual Device emulator. 

## Aim

The lab aims to;

1. Provide an understanding to setting up your own development environment, installing and configuring all the relevant tools required for this module. 
2. Provide background knowledge into mobile application development. Focussing on utilising the emulator and devices for testing and debugging.



## Intended Learning Outcome ##

This lab intends to contribute towards achieving ILO's 1 and 5: Develop a cross platform application for mobile using a modern development environment, and Explain and discuss modern issues in cross platform application development.



## Introduction

In this lab, we are going to go familiarise ourselves with setting up our development environments. For this module we will focus on using Visual Studio Code as our Integrated Development Environment (IDE).

The labs have been are designed to introduce you to a new topic and provide you with the foundations in order to complete your coursework. Each lab sheet has enough content for the timetabled session and your independent learning (you should continue with the lab sheet until its completed as each week builds on previous knowledge and understanding). 



## Activities

This lab is designed for those students wishing to set up the environment on their own machines. The labs will have all the software installed and ready to develop with. 

The following activities are designed to introduce setting up the toolchain for cross platform development. The lab sheet is aimed at setting up Visual Studio Code on Windows (it will differ slightly on MacOS). If you are running MacOS and need further support, contact your tutor. 

In the first part of this lab we will download and install our own environments for building mobile applications on to our own machines. This is different if you are running Windows, Mac or Linux. It is always best to check the source’s instructions on performing this installation as newer versions are developed so might the process to set up. At the time of writing this lab the following URLs are valid for providing help with downloading and installing Android Studio on your chosen desktop Operating System (OS). 

- Windows: https://flutter.dev/docs/get-started/install/windows
- Mac: https://flutter.dev/docs/get-started/install/macos
- Linux: https://flutter.dev/docs/get-started/install/linux

> **Remember** for any of your modules it's good housekeeping to create a structure to your work. Each module should have its own folder, inside each module, you should split up the work either by lecture and labs or weeks. Inside each lab, you should further breakdown your work. You should also have a separate folder for assignments. This will help you manage your workload as your course progresses.    



### Activity 1: Getting started with Visual Studio Code, Flutter and Android SDK for Windows ###

Making sure the toolchain is set up correctly is a vital job when developing cross platform mobile applications. Once you have the environment set up and linked correctly you shouldn't see any issues further down the line. It is important you follow these steps correctly to ensure smooth running of the code you develop. 

- [ ] Download and install [Visual Studio Code](https://code.visualstudio.com/). Alongside the IDE, we are going to need to also download a Software Development Kit (SDK). The SDK is a collection of software tools in one package (framework, compiler, debugger). During our application development we will be using the Flutter SDK.

- [ ] Configure VSC to work with Flutter by installing the Flutter extension

  - [ ] Open the extensions tab (left toolbar)
  - [ ] Search for flutter in the search bar
  - [ ] Click flutter and install

- [ ] Download the [Flutter SDK](https://flutter.dev/docs/get-started/install) relevant to your OS 

- [ ] Extract the files into a directory on your computer. e.g., "C:\Src\flutter"

  Developing in Flutter in VSC requires the Android SDK. In order to obtain the SDK you must also download Android Studio 

- [ ] Download [Android Studio](https://developer.android.com/studio?gclid=CjwKCAjw7rWKBhAtEiwAJ3CWLAYbpYnrHksQlZ2LLdBmsXppqESgRFIu54lloPv-AXNwUNiInnMdNxoCLiUQAvD_BwE&gclsrc=aw.ds) and install

- [ ] Follow and proceed with any on screen requests 

- [ ] Open Android Studio, we need to find the path where the Android SDK is installed

- [ ] Locate the settings window (customise tab)

- [ ] Click "All settings" to show more settings

- [ ] In the search bar type 'sdk' 

  The search will provide you with the Android SDK settings. For now all we want is the path of the SDK

- [ ] Copy the path 

  The next step involves telling Windows where the Flutter and Android SDKs are located

- [ ] In Windows search bar, type "env" and enter

- [ ] Open Environment Variables

- [ ] In the User variables section, click path and edit

- [ ] Click new to add a new path environment

- [ ] Paste the Android SDK path and press enter

- [ ] Whilst in the path environments, click new once more and then browse (to add the Flutter SDK path)

- [ ] Locate the Flutter SDK installed and open the bin folder, click OK (e.g., C:\Src\flutter\bin)

  This should now have added both the Android and Flutter SDKs to the environment path

- [ ] Restart the computer

- [ ] Open VSC and click Terminal 

- [ ] Inside the Terminal type "flutter doctor" flutter doctor checks to make sure all your toolchain is set up correctly. The first time you run this, it is expected to have errors.

- [ ] Firstly, you need to manually add the path to the Android SDK. Type flutter config --android-sdk "full path to Android SDK" 

- [ ] Press enter

- [ ] Run 'flutter doctor' again

- [ ] If you see an error about cmdline-tools missing you need to specify the following:

  - [ ] path-to\sdkmanager --install "cmdline-tools;latest" (replacing the path-to\sdkmanager with the Android SDK path appending \tool\bin\sdkmanager to the end of it, e.g., C:\Users\***\AppData\Local\Android\Sdk\tools\bin\sdkmanager)
  - [ ] Run this command and follow any on screen messages, you will need to enter y to agree to the terms 
  - [ ] Finally run "flutter doctor --android-licenses"
  - [ ] Again entering y to agree to the terms

If this doesn't work you will need to install the Command Line Tools via Android Studio SDK 

- [ ] Open Android Studio
- [ ] Tools > SDK Manager (or the three dots)
- [ ] Select Android SDK in the left side panel
- [ ] Click on the SDK Tools tab
- [ ] Tick Android SDK Command Line Tools > Apply > OK 

- [ ] Run flutter doctor once more - hopefully now it should complete without errors - the toolchain is the hardest part about getting started with cross platform application. Well done for getting this far

> If you are still having issues contact your tutor to ask for more assistance before moving on

### Activity 2: Creating a Virtual Device

If you don’t have an Android device, you can test your apps in the emulator. This module will demonstrate how to debug your apps on both the emulator and devices. For this part of the lab we will download and setup the Android Studio Emulator (Android Virtual Device – AVD). 

- [ ] Open Android Studio, select more actions (the hidden menu, dot dot dot), select AVD Manager 
- [ ] Click Create Virtual Device 
- [ ] Choose a device you wish to emulator (**recommended** Pixel 5 without Play Store installed - you don't need this)
- [ ] Click Next
- [ ] Choose the Android OS you wish to install on the emulator (**recommended** the latest release that is pre-installed with Android Studio)
- [ ] Click Download - depending on your connection this might take some time 
- [ ] Once completed, name your device
- [ ] Click finish, to run your emulator for the first time click the play button inside actions. This might take some time the first time it's ran

> **Note** depending on your machines processor (Intel or AMD) you will need to install further software to ensure the emulator works correctly. The following step is to be followed for those running and AMD processor. 
>
> - [ ] Once the Android OS has installed, you should see a red recommendation message appear requesting the install of "Android Emulator Hypervisor Driver for AMD Processors" click this link follow the on screen instructions. If the install fails it is most likely due to a setting in your bios that needs enabling. The setting is called SVM. Check with your motherboard manufacturer in how to enable this setting.

### Activity 3: Testing your Environment ###

The wizard which sets up the environment in VSC is initiated through the command palette.

- [ ] Click view > "Command Palette" 

- [ ] Type Flutter

- [ ] Select "New Flutter Project"

  The wizard will create all the necessary files to build a Flutter project. It will build a project with scaffolding code. Code that is used to make sure the project is set up correctly and compiles without errors. This example is the Flutter counter application. All the files will be created and visible in the explorer pane. We will go through these in the lecture. For now lets see if the project compiles and runs

- [ ] Open the "main.dart" file locations inside the "lib" folder

- [ ] To test the application on the emulator, you need to select the device you wish to run the code on. From the devices tab (located on the bottom bar, currently set to Chrome (web-javascript)). If you have built your emulator correctly you should see this as an option in the device list

  <img src="https://github.com/UCLanCSC/CSResources/blob/main/images/mobile/Screenshot%202021-09-27%20143413.png?raw=true">

  > It is important to note here, that if you run in Chrome or Edge browsers rather than a mobile device, the dart code which Flutter is built with is converted into JavaScript. 

  Once you've selected the device the AVD should open the emulator ready for debugging.

- [ ] Now you are ready to run/debug the application. From the Run menu, click "Start Debugging".

  Your code will then be compiled for the Android device selected. This will take some time the first time you are compiling and running the code. Don't worry about how long its taking. In the meantime you can review the lecture notes. 

  Inside the debug console pane, you will see updates on the operations from the compiler and debugger. We will go into more detail about how to efficiently use the tools in VSC later in the module. Once it's ready the emulator will load the application for you to test to review is the cross platform toolchain is hooked up correctly. 

  <img src="https://github.com/UCLanCSC/CSResources/blob/main/images/mobile/Screenshot%202021-09-27%20144453.png?raw=true" >

> **Remember** have your worked signed off weekly by your tutor.