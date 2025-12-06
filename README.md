# EGKey (ErgoKey)

A custom ergonomic keyboard PCB design using Choc-style hotswap sockets, a face-down Promicro footprint, and an optional OLED. This repository contains KiCad board sources, generated gerbers, mechanical DXF outlines, and footprint helper scripts driven by a YAML configuration.

---

## Quick Status

- **Branch:** `main`
- **Languages:** JavaScript (helper/footprint scripts)

## Repository Layout

- `config.yaml`: Project configuration driving key matrix, thumb cluster, outlines, mounting holes, and standoff definitions.
- `pcbs/`: KiCad board files and generated outputs.
  - `pcbs/tutorial.kicad_pcb`: Primary KiCad PCB for the tutorial/board.
  - `pcbs/EGKeyGerb/`: Pre-generated Gerber set and drill files for fabrication.
- `footprints/`: Helper/custom footprint files (example: `mountinghole.js`).
- `output/outlines/`: DXF exports useful for mechanical fabrication and overlays (e.g., `board.dxf`, `keys.dxf`, `combo.dxf`, `raw.dxf`).

## Key Features

- Choc hotswap sockets placed per layout rules.
- Promicro footprint oriented face-down (undermounted controller).
- Optional OLED footprint with SDA/SCL nets assigned.
- Diode footprints supporting through-hole or SMD styles.
- Mounting holes and standoffs defined in `config.yaml`.
- DXF and Gerber outputs provided for fabrication.

## Getting Started

### Prerequisites

- KiCad (recommended recent stable release; KiCad 6+).
- A text editor to view/modify `config.yaml`.
- Optional: Gerber viewer (e.g., `gerbv`) or an online Gerber viewer.

### Open the board in KiCad

1. Launch KiCad and open `pcbs/tutorial.kicad_pcb`.
2. Inspect footprints in the `Footprint Editor` and nets in the schematic (if present).

### Generate Gerbers (KiCad GUI)

1. In PCB Editor: `File → Fabrication Outputs → Gerber`.
2. Export drill files: `File → Fabrication Outputs → Drill Files`.

### Inspect Gerbers (example)

If `gerbv` is installed you can open the generated gerbers:

```powershell
gerbv pcbs\EGKeyGerb\*.gbr
```

### Use DXF outlines

DXFs are in `output\outlines\`. Import them into your CAD/CAM tool or send them to your CNC/laser vendor.

## Recommended Workflow

1. Edit `config.yaml` (if you use a generator script to update placement/outlines).
2. Modify footprints in `footprints/` if necessary.
3. Open `pcbs/tutorial.kicad_pcb` in KiCad and make board-level edits.
4. Generate and verify Gerbers and DXFs; validate in a Gerber viewer before sending to fab.



## Fabrication Tips

- Confirm board stackup and copper thickness with your PCB fab.
- Verify mechanical tolerances for Choc sockets and mounting holes before production.
- Use the provided `pcbs/EGKeyGerb/` set as a reference; re-run gerber export from your KiCad version after any edits.

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

## Contact

Repo owner: `Sh4rk-glitch` (GitHub). Open issues or PRs on this repository.

---

All images are located on my journal, at:
[https://blueprint.hackclub.com/projects/5019](url)

If you have any questions, email me at shouryamishra011@gmail.com
