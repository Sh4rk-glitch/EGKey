# EGKey (ErgoKey)

A custom ergonomic keyboard PCB design using Choc-style hotswap sockets, a face-down Promicro footprint, and an optional OLED. This repository contains KiCad board sources, generated gerbers, mechanical DXF outlines, and footprint helper scripts driven by a YAML configuration.

---

# Files

# CAD
Inside `EGKey main file` there are many different files below is what is most important and how to get there: 
Starting off with the CAD files, the CAD is under `CAD files`. The main CAD file is `case. step`, if you want the other CAD files then click on `cases` and the rest are in there.
To see the outlines for the CAD go to `config.yaml` and then `output` and then `outlines`.

# PCBs
The PCBs are under `pcbs` then going to `ALL PCBS`. The main PCB file is `EGKeyMasterPCB`, if you wish to see the no routing and my previous attempts at routing then click on `EGKey-noRouting` and `EGKeyPCB-routingV2`.
The gerber file is under `pcbs` then click on the `EGKeyGerb` file, it's a zip file so it'll download as a zip.
Under `config.yaml` the footprint for the mounting hole is there under `footprints` and then its the only file under there.

# Firmware
To get to the firmware file, click on `firmware` which will be under `EGKey main file` and then inside `firmware` will be all the firmware writting for EGKey.

## Bill of Materials
  Part                                 Count                     Cost
- PCB Fab (With Shipping)	               1	                  $30.00 USD
- Arduino Pro Micro	                     1	                  $10.00 USD
- OLED Display	                         1	                   $4.00 USD
- Kailh Choc v2 Switches	               6 (58 Keys Total)	  $30.00 USD
- 1N4148 Diodes (SMD)	                   6 (58 Diodes Total)	 $2.00 USD
- Kailh Choc Hotswap Sockets	           6 (58 Sockets Total)	$10.00 USD
- Reset Switch (SMD, 4 Pin, Flat)	       1	                   $0.50 USD
- Mill Max Sockets & Pins	               1	                   $7.50 USD
- Medium Profile Controller Socket	     1	                   $0.50 USD
- Choc v1 Keycaps	                       1	                  $50-75 USD

Total: $140-160 USD

---

All images are located on my journal, at:
[https://blueprint.hackclub.com/projects/5019](url)

If you have any questions, email me at shouryamishra011@gmail.com
