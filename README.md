# Robot Devices, Kinematics, Dynamics, and Control — Labs

Personal lab work for **EN.530.646 · Fall 2026 · Johns Hopkins University**.

This repository keeps instructor materials alongside my MATLAB code and written results, organized by lab. It currently contains Lab 0 setup materials and Lab 1 work. Later labs will be added as they are assigned.

## Repository layout

```text
.
├── materials/                    # Original files provided by the instructor
│   ├── lab0/
│   │   └── Lab0_RDKDC_2026F_Jazzy.pdf
│   └── lab1/
│       ├── Lab1_RDKDC_2026F.pdf
│       ├── Matlabcodes_Lab1.zip
│       └── UR5ROS2code.zip
├── lab1/
│   ├── code/                     # MATLAB scripts, functions, and support code
│   └── written/                  # Submitted figures and written responses
├── .gitattributes
├── .gitignore
└── README.md
```

Original instructor ZIP files are preserved as distributed. The working code is in `lab1/code/`, so there is no need to unpack the starter archives to use the Lab 1 work.

## Lab index

| Lab | Focus | Materials | My work |
| --- | --- | --- | --- |
| 0 | MATLAB and ROS 2 environment setup | [Instructions](materials/lab0/Lab0_RDKDC_2026F_Jazzy.pdf) | — |
| 1 | Robot simulation, rotations, and rigid body transformations | [Assignment and starter files](materials/lab1/) | [Code](lab1/code/) · [Written results](lab1/written/) |

## Lab 1

The [code folder](lab1/code/) contains:

- `lab1_1.m`: Task 1 script for a sequence of robot joint configurations.
- `lab1_2.m`: Task 2 experiments, numerical checks, and figure exports.
- Rotation and transformation functions: `ROTX`, `ROTY`, `ROTZ`, `EULERXYZ`, `EULERXYZINV`, `SKEW3`, `SKEW6`, `EXPCR`, `EXPCF`, and `FINV`.
- Plotting helpers and the supplied ROS 2 interface files.

The [written folder](lab1/written/) contains the existing PDF figures and PNG responses, named by task number. These are part of the lab record and are tracked in Git.

### Environment and use

The course environment uses MATLAB, ROS Toolbox, Robotics System Toolbox, ROS 2 Jazzy, and the course `rdkdc` simulation package. Follow the [Lab 0 instructions](materials/lab0/Lab0_RDKDC_2026F_Jazzy.pdf) for setup.

For Task 2, set MATLAB's current folder to `lab1/code/`, then run:

```matlab
lab1_2
```

Figure exports are saved in `../written/`. Running the script again replaces the corresponding existing figures.

For Task 1, start the appropriate course simulation before running the script. The assignment gives this UR5e simulation command:

```bash
ros2 launch rdkdc ur5e_simulation.launch.py
```

The Task 1 script uses the bundled `ur5_interface` class. Follow the course setup instructions for your robot model and simulation.

The repository organization has been checked; the MATLAB scripts have not been rerun as part of this import.

## File conventions

- Put each new instructor handout or starter archive under `materials/labN/`, retaining its original filename and contents.
- Add `labN/code/` and `labN/written/` when starting that lab. Lab 2 and later folders are left for future work.
- Commit source code, written responses, and selected results needed to understand the lab.
- Keep submission packages in a local `submissions/` folder. Generated ZIP files are ignored everywhere except under `materials/`, where instructor archives are intentionally tracked.
- MATLAB autosaves, editor backups, and ROS build/cache folders are ignored.

## Course materials and attribution

Instructor handouts, starter archives, and supplied support code belong to their respective authors. The handouts restrict redistribution; keep this repository private and use the materials only as permitted by the course. No redistribution license is granted for the course materials.

Authorship and assistance notes already present in the code are retained.
