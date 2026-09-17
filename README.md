# betterKSP

A curated, state-of-the-art mod pack for **Kerbal Space Program 1.12.5**. It targets modern
graphics, sound, quality of life, and the Nertea part packs. It installs in one step with
[CKAN](https://github.com/KSP-CKAN/CKAN), the standard KSP mod manager.

The selection uses the CKAN download counts of September 2026 and the recommendations of
JonnyOThan (maintainer of FreeIva and RasterPropMonitor).

## Install

You need KSP 1.12.5 and CKAN. Then choose one of these methods.

### CKAN GUI (Windows, macOS, Linux)

1. Download `sota-modpack.ckan` from this repository.
2. Open CKAN and select your KSP install.
3. Click **File > Install from .ckan** and select the file.
4. Accept the list of mods. CKAN downloads about 8 GB.

### CKAN command line (one line)

```sh
ckan install -c https://raw.githubusercontent.com/LckyLke/betterKSP/main/sota-modpack.ckan --headless
```

### Slow connection: play sooner

Install `phase1-modpack.ckan` first. It holds the small mods (about 1.5 GB). Start the game with it.
Then install `sota-modpack.ckan` while you play. It adds the large texture and part packs. Restart the game after it finishes.

### Optional extras

`extras-modpack.ckan` adds heavy extras: Bluedog Design Bureau (real rockets), the Space Shuttle,
the Kcalbeloh star system, Minor Planets Expansion, and Kerbal Konstructs with KSC Extended.

## After the install

* Set **Graphics > Terrain Detail** to **High**. Parallax Continued needs it.
* Set **Terrain scatter** off. Parallax Continued draws its own scatters.
* Set anti-aliasing off in KSP and in Scatterer. Use the TUFX temporal anti-aliasing instead.
* **Linux**: run the game through Proton with `-force-d3d11 -popupwindow %command%` as launch options.
  The Parallax Continued author recommends this. The native OpenGL build can crash with Parallax Continued.

### Manual upgrade that is not on CKAN

Blackrack's **True Volumetric Clouds** (Patreon, version 3 is free) replaces the Astronomer's Visual Pack clouds.
Remove `AstronomersVisualPack` before you install it.

## Mod list

### Core and performance

| CKAN identifier | Name | What it does |
|---|---|---|
| `ModuleManager` | Module Manager | Modify KSP configs without conflict |
| `KSPCommunityFixes` | KSP Community Fixes | Fixes for stock bugs, also provides various QoL/UI improvements |
| `Harmony2` | Harmony 2 | A library for patching, replacing and decorating .NET and Mono methods during runtime |
| `KSPBurst` | KSPBurst Compiler | Better multithreaded performance for mods that use it. Requires Mono on Linux and macOS... |
| `BurstPQS` | Burst PQS | Optimized terrain generation for KSP |
| `Shabby` | Shabby | Shader asset bundle loader for KSP |
| `ClickThroughBlocker` | ClickThrough Blocker | Helps eliminate the clickthrough problem with mods |
| `ToolbarController` | Toolbar Controller | Wrapper mod around the Blizzy and stock toolbars |

### Visuals

| CKAN identifier | Name | What it does |
|---|---|---|
| `Kopernicus` | Kopernicus Planetary System Modifier | Allows users to replace the planetary system used by the game |
| `ParallaxContinued` | Parallax Continued | A visual mod which overhauls the planet shaders and adds grass, forest, and other types... |
| `Deferred` | Deferred | Add deferred rendering to KSP |
| `TUFX` | TUFX | Post-processing FX for KSP |
| `Shaddy` | Shaddy | Shaddy is a collection of shaders made for Kerbal Space Program |
| `Firefly` | Firefly | A mod for Kerbal Space Program that enhances reentry and aerodynamic effects. |
| `TexturesUnlimited` | Textures Unlimited | KSP Shader, Texture, and Modeling Utilities |
| `Waterfall` | Waterfall Core | Core Waterfall plugin to drive engine effects, plus default effect templates. Does noth... |
| `StockWaterfallEffects` | Stock Waterfall Effects | This Kerbal Space Program mod contains config files that give Waterfall effects to the... |
| `Scatterer` | scatterer | Atmospheric scattering shaders |
| `EnvironmentalVisualEnhancements` | Environmental Visual Enhancements | City Lights for Kerbin and Clouds for Any planet you wish |
| `AstronomersVisualPack` | Astronomer's Visual Pack | The total visual overhaul for Kerbal Space Program, originally by Astronomer. |
| `AVP-8kTextures` | Astronomer's Visual Pack-8k Textures | Textures for Astronomer's Visual pack |
| `DistantObject` | Distant Object Enhancement /L | Visual enhancement mod that makes objects realistically visible over large distances |
| `DistantObject-default` | Distant Object Enhancement /L default config | Default planets colors |
| `PlanetShine` | PlanetShine | Planets and moons reflects their light to your vessel + other ambient light improvements |
| `PlanetShine-Config-Default` | PlanetShine - Default configuration | Planets and moons reflects their light to your vessel + other ambient light improvements |
| `ReStock` | ReStock | A community-built replacement for KSP's part models and textures. No effects on gameplay |
| `ReStockPlus` | ReStock+ | A carefully curated set of new parts that fill gaping holes in the stock lineup, adding... |

### Sound

| CKAN identifier | Name | What it does |
|---|---|---|
| `RocketSoundEnhancement` | Rocket Sound Enhancement | Plugin for modders to add more detailed sound effects to the game, featuring a robust L... |
| `RocketSoundEnhancement-Config-Default` | Rocket Sound Enhancement - Default | RSE sounds for stock engines, wheels, decouplers, and more |
| `Chatterer` | Chatterer | A plugin for Kerbal Space Program which adds some SSTV, beeps, and nonsensical radio ch... |
| `ShipEffectsContinued` | Ship Effects Continued | This adds rattles, vibrations, stress sounds to your ship depending on how much thrust,... |

### Quality of life and tools

| CKAN identifier | Name | What it does |
|---|---|---|
| `MechJeb2` | MechJeb 2 | Anatid Robotics and Multiversal Mechatronics proudly presents the first flight assistan... |
| `KerbalEngineerRedux` | Kerbal Engineer Redux | Reveals important statistics about your ship and its orbit during building and flight |
| `RCSBuildAid` | RCS Build Aid | This is something I made for placing RCS thrusters in the right positions in the first... |
| `TrackingStationEvolved` | Tracking Station Evolved | An addon to improve the tracking station vessel selection list. |
| `NavballDockAlignIndCE` | Navball Docking Alignment Indicator CE-2 | Adds an alignment indicator to the navball |
| `VABOrganizer` | VAB Organizer | Small UI plugin that shows visual size tags on parts in the VAB as well as dividing the... |
| `EditorExtensionsRedux` | Editor Extensions Redux | Tweaks and features for the in-game vessel editor, e.g. alignment and symmetry aids. No... |
| `Trajectories` | Trajectories | The mod displays trajectory predictions, accounting for atmospheric drag, lift, etc. Wo... |
| `TransferWindowPlanner` | Transfer Window Planner | An ingame implementation of Alexmun's Launch Window Planner |
| `DockingPortAlignmentIndicator` | Docking Port Alignment Indicator | The Docking Port Alignment Indicator is designed to help you dock manually, by presenti... |
| `BetterTimeWarpCont` | BetterTimeWarpContinued | Improved time warping |
| `HangerExtenderExtended` | Hangar Extender | Extend your VAB/SPH so you can build really massive rockets |
| `EasyVesselSwitch` | Easy Vessel Switch (EVS) | The stock game doesn't offer a consistent model of the camera positioning when the acti... |
| `xScienceContinued` | [x] Science! Continued | The Science Report and Checklist for KSP.  [x] Science! keeps track of the science expe... |
| `ScienceAlert` | ScienceAlert ReAlerted | Let you know when Science is available, and lets you run it |
| `SCANsat` | SCANsat | SCANsat: Real Scanning, Real Science, Warp Speed! |
| `KAS` | Kerbal Attachment System | KAS introduces new gameplay mechanics by adding winches, struts, and pipes. Now you can... |
| `FreeIva` | FreeIva | Get out of your seat in IVA and float around your ship |
| `RasterPropMonitor` | RasterPropMonitor | Modifies stock and some modded IVAs with functional props |
| `AtmosphereAutopilot` | AtmosphereAutopilot (Fly-By-Wire) | Atmosphere autopilot is a modular atmospheric flight control system library.
It feature... |
| `HullcamVDSContinued` | HullcamVDS Continued | Many types of cameras for vessels |
| `TweakScaleRescaled` | TweakScale Rescaled | Rescale parts in the vessel editor.  Faster, more features, fewer bugs. |

### Parts (Nertea and friends)

| CKAN identifier | Name | What it does |
|---|---|---|
| `CommunityTechTree` | Community Tech Tree | Community-developed tech tree extension, with support for many mods. |
| `NearFuturePropulsion` | Near Future Propulsion | Advanced electric engines and two new fuel types in a fully developed stockalike aesthe... |
| `NearFutureSolar` | Near Future Solar | New solar panels in a variety of sizes and types |
| `NearFutureElectrical` | Near Future Electrical | Nuclear reactors, capacitors and more batteries that fit right in with stock |
| `NearFutureConstruction` | Near Future Construction | Structural components and truss segments for building deep space vessels and bases. Inc... |
| `NearFutureSpacecraft` | Near Future Spacecraft | New command pods, control systems and engines for crewed spacecraft |
| `NearFutureLaunchVehicles` | Near Future Launch Vehicles | Large launch vehicle parts in the 5 and 7.5m size categories |
| `NearFutureAeronautics` | Near Future Aeronautics | Advanced aerospace parts including intakes, propellers, jet/multimode/nuclear engines f... |
| `NearFutureExploration` | Near Future Exploration | Expands probe selection with new cores, new probe bus parts, mini satellite parts and a... |
| `CryoEngines` | Cryogenic Engines | Provides new, very high efficiency engines in 1.25m, 2.5m and 3.75m size classes that b... |
| `CryoTanks` | Cryo Tanks | Liquid Hydrogen fuel tanks and Liquid Hydrogen storage for most stock tanks |
| `KerbalAtomics` | Kerbal Atomics | Several new nuclear thermal rockets, running on liquid hydrogen tanks with simple boilo... |
| `HeatControl` | Heat Control | New categories of heat radiator for your spacecraft |
| `FarFutureTechnologies` | Far Future Technologies | Adds far future but still more or less possible engine, power generation and resource p... |
| `StationPartsExpansionRedux` | Stockalike Station Parts Expansion Redux | A plethora of new station parts in several size classes. |
| `PlanetsideExplorationTechnologies` | Planetside Exploration Technologies | Surface base, MMSEV, & wind turbine parts |
| `ModularLaunchPads` | AlphaMensae's Modular Launch Pads | Beyond launch clamps: Mix-and-match components to build all kinds of launch infrastructure |
| `SpaceXLegs` | Kerbal Reusability Expansion | KRE - A collection of parts to make your rockets reusable. |

### Planets

| CKAN identifier | Name | What it does |
|---|---|---|
| `OuterPlanetsMod` | Outer Planets Mod | The Outer Planets Mod is a mod that expands the outer edges of the Kerbol system to cre... |
| `OuterParallax` | Outer Parallax Common Files | Files common to OuterParallax-OPM and OuterParallax-MPE |
| `OuterParallax-OPM` | OuterParallax-OPM | Adds Parallax Continued configs for OPM with custom assets. |

### Extras (optional pack)

| CKAN identifier | Name | What it does |
|---|---|---|
| `BluedogDB` | Bluedog Design Bureau | Stockalike parts pack for Kerbal Space Program |
| `ShuttleOrbiterConstructionKit` | Shuttle Orbiter Construction Kit | Stockalike parts for NASA's Space Shuttle Orbiter. |
| `KcalbelohSystem` | Kcalbeloh System | A planet mod for Kerbal Space Program adding a black hole system. |
| `MinorPlanetsExpansion` | Minor Planets Expansion | Official GitHub of Exo's Minor Planets Expansion, where indev features and full builds... |
| `OuterParallax-MPE` | OuterParallax-MPE | Adds Parallax Continued configs for MPE with custom assets. |
| `KerbalKonstructs` | Kerbal Konstructs | New buildings and launch sites |
| `KSCExtended` | KSC Extended | This is a collaboration between me and Omega482 to give you the best possible KSC exper... |

## Update the pack

Run `ckan upgrade --all` to update every mod. The pack file pins no versions, so CKAN installs the newest compatible releases.

## License

The pack files in this repository are released under CC0 1.0. Each mod keeps its own license.
