# Nanowires in 90 refractory random binaries

## Foreword

The purpose of this project is to calculate the yield strengths of nanowires in 90 refractory random binaries that consist of 5 refractory metals: Mo, Nb, Ta, V, and W. Both tensile and compressive loadings will be considered. In addition, because of the randomness in atomic distribution, three distributions are considered for each binary. As a result, a total of $90 \times 2 \times 3 = 540$ calculations are needed.

The tensile and compressive yield strengths of nanowires in all 10 ternaries, 5 quaternaries, and 1 quinary that are made of the same 5 metals have been calculated in [this paper](http://dx.doi.org/10.1016/j.jallcom.2023.170556), which should be followed very closely. Yield strengths of nanowires in the 5 pure metals were calculated in the same paper too.

## Mo<sub>1-_x_</sub>Nb<sub>_x_</sub> binary

### _x_ = 0.1, tensile deformation

#### Distribution 1

Create a new directory on OSCER named `Mo0.9Nb0.1_T1` and copy four files `CrMoNbTaVW_Xu2022.eam.alloy`, `lmp_T.in`, `lmp.batch`, and `max_curve.sh` there. The first file can be found in [another GitHub repository](https://github.com/shuozhixu/CMS_2022) while all other files can be found in the `tension/` directory in this GitHub repository.

Submit the job by

	sbatch lmp.batch

The job should be finished within 72 hours. Once it is finished, you will find a file `strain-stress` in the same directory where you submit the job. The first column is the strain while the second column is the stress. The tensile strength is the maximum stress. To quickly find out the maximum tensile stress and its corresponding strain, run

	sh max_curve.sh

#### Distribution 2

Create a new directory on OSCER named `Mo0.9Nb0.1_T2` and copy three files `CrMoNbTaVW_Xu2022.eam.alloy`, `lmp_T.in`, `lmp.batch`, and `max_curve.sh` there. Prior to submitting the job, we should make the following change in `lmp_T.in`:

- line 26, change the number `134` to any other integer

Then, submit the job by

	sbatch lmp.batch

Follow the procedure above to find out the tensile strength for the 2nd distribution of the Mo<sub>0.9</sub>Nb<sub>0.1</sub> nanowire.

#### Distribution 3

Follow the procedure above to find out the tensile strength for the 3rd distribution of the Mo<sub>0.9</sub>Nb<sub>0.1</sub> nanowire.

Eventually, calculate the mean tensile strength and record it for Mo<sub>0.9</sub>Nb<sub>0.1</sub>.

### _x_ = 0.1, compressive deformation

Create three new directories on OSCER named `Mo0.9Nb0.1_C1`, `Mo0.9Nb0.1_C2`, and `Mo0.9Nb0.1_C3`, respectively. Copy four files `CrMoNbTaVW_Xu2022.eam.alloy`, `lmp_C.in`, `lmp.batch`, and `min_curve.sh` into each directory. The first file can be found in [another GitHub repository](https://github.com/shuozhixu/CMS_2022) while all other files can be found in the `compression/` directory in this GitHub repository.

Follow the procedure above to modify files and run LAMMPS simulations. Here, the compressive strength is the minimum stress, which can be found by

	sh min_curve.sh

In the end, calculate the mean compressive strength and record it for Mo<sub>0.9</sub>Nb<sub>0.1</sub>.

### _x_ = 0.2

Conduct LAMMPS simulations to calculate the tensile and compressive strengths, respectively, for the Mo<sub>0.8</sub>Nb<sub>0.2</sub> system. In addition to the changes we made above, make the following two additional changes to `lmp_T.in` or `lmp_C.in`:

- line 8, change the number `3.1581` to the lattice parameter of Mo<sub>0.8</sub>Nb<sub>0.2</sub>
- line 26, change the number `0.1` to the value of _x_, i.e., `0.2`

Lattice parameters of all random binaries can be found in the file `lat_para.xlsx` in this GitHub repository.

### Other _x_

Following the procedure above to calculate all other Mo<sub>1-_x_</sub>Nb<sub>_x_</sub> systems, where _x_ varies from 0.3 to 0.9.

## Other binary systems

Below is a list of other 9 random binary systems:

- Mo<sub>1-_x_</sub>Ta<sub>_x_</sub>
- Mo<sub>1-_x_</sub>V<sub>_x_</sub>
- Mo<sub>1-_x_</sub>W<sub>_x_</sub>
- Nb<sub>1-_x_</sub>Ta<sub>_x_</sub>
- Nb<sub>1-_x_</sub>V<sub>_x_</sub>
- Nb<sub>1-_x_</sub>W<sub>_x_</sub>
- Ta<sub>1-_x_</sub>V<sub>_x_</sub>
- Ta<sub>1-_x_</sub>W<sub>_x_</sub>
- V<sub>1-_x_</sub>W<sub>_x_</sub>

Follow the procedures above to modify files, run LAMMPS simulations, and calculate the mean tensile and compressive strengths.

For example, for the tensile deformation of Ta<sub>0.7</sub>W<sub>0.3</sub>,

- Create three new directories on OSCER named `Ta0.7W0.3_T1`, `Ta0.7W0.3_T2`, and `Ta0.7W0.3_T3`.
- Move all necessary files to each directory.
- In `lmp_T.in`,
	- line 8, change `3.2076` to `3.256250412`, which is the lattice parameter of Ta<sub>0.7</sub>W<sub>0.3</sub>
	- line 26, change the second-to-last number to 0.3
	- line 26, make sure the last number varies among the three distributions for Ta<sub>0.7</sub>W<sub>0.3</sub>
	- line 30, change `Mo Nb` to `Ta W`
- Submit three jobs from three directories, respectively.

Again, lattice parameters of all random binaries can be found in the file `lat_para.xlsx` in this GitHub repository.

## Assignment

Aaron Sheffer

- Mo<sub>0.9</sub>Nb<sub>0.1</sub>, Mo<sub>0.8</sub>Nb<sub>0.2</sub>, Mo<sub>0.7</sub>Nb<sub>0.3</sub>, Mo<sub>0.6</sub>Nb<sub>0.4</sub>, and Mo<sub>0.4</sub>Nb<sub>0.6</sub>

Alex Ramirez

- Mo<sub>0.9</sub>Ta<sub>0.1</sub>, Mo<sub>0.8</sub>Ta<sub>0.2</sub>, Mo<sub>0.7</sub>Ta<sub>0.3</sub>, Mo<sub>0.6</sub>Ta<sub>0.4</sub>, and Mo<sub>0.4</sub>Ta<sub>0.6</sub>

Joshua Hall

- Mo<sub>0.9</sub>V<sub>0.1</sub>, Mo<sub>0.8</sub>V<sub>0.2</sub>, Mo<sub>0.7</sub>V<sub>0.3</sub>, Mo<sub>0.6</sub>V<sub>0.4</sub>, and Mo<sub>0.4</sub>V<sub>0.6</sub>

Marius Bauer

- Mo<sub>0.9</sub>W<sub>0.1</sub>, Mo<sub>0.8</sub>W<sub>0.2</sub>, Mo<sub>0.7</sub>W<sub>0.3</sub>, Mo<sub>0.6</sub>W<sub>0.4</sub>, and Mo<sub>0.4</sub>W<sub>0.6</sub>

Ethan Lane

- Nb<sub>0.9</sub>Ta<sub>0.1</sub>, Nb<sub>0.8</sub>Ta<sub>0.2</sub>, Nb<sub>0.7</sub>Ta<sub>0.3</sub>, Nb<sub>0.6</sub>Ta<sub>0.4</sub>, and Nb<sub>0.4</sub>Ta<sub>0.6</sub>

Mark MacNeill

- Nb<sub>0.9</sub>V<sub>0.1</sub>, Nb<sub>0.8</sub>V<sub>0.2</sub>, Nb<sub>0.7</sub>V<sub>0.3</sub>, Nb<sub>0.6</sub>V<sub>0.4</sub>, and Nb<sub>0.4</sub>V<sub>0.6</sub>

Derek Alexander

- Nb<sub>0.9</sub>W<sub>0.1</sub>, Nb<sub>0.8</sub>W<sub>0.2</sub>, Nb<sub>0.7</sub>W<sub>0.3</sub>, Nb<sub>0.6</sub>W<sub>0.4</sub>, and Nb<sub>0.4</sub>W<sub>0.6</sub>

Thomas Ward

- Ta<sub>0.9</sub>V<sub>0.1</sub>, Ta<sub>0.8</sub>V<sub>0.2</sub>, Ta<sub>0.7</sub>V<sub>0.3</sub>, Ta<sub>0.6</sub>V<sub>0.4</sub>, and Ta<sub>0.4</sub>V<sub>0.6</sub>

Marco Borsatto

- Ta<sub>0.9</sub>W<sub>0.1</sub>, Ta<sub>0.8</sub>W<sub>0.2</sub>, Ta<sub>0.7</sub>W<sub>0.3</sub>, Ta<sub>0.6</sub>W<sub>0.4</sub>, and Ta<sub>0.4</sub>W<sub>0.6</sub>

Note: each student will conduct $5\times 2\times 3 = 30$ LAMMPS simulations. Once all simulations are finished, upload the following to Canvas:

- All `strain-stress` files
- Values of the mean tensile and compressive strengths, respectively, for each binary 

## Reference

If you use any files from this GitHub repository, please cite

- Shuozhi Xu, Abdullah Al Mamun, Sai Mu, Yanqing Su, [Uniaxial deformation of nanowires in 16 refractory multi-principal element alloys](http://dx.doi.org/10.1016/j.jallcom.2023.170556), J. Alloys Compd. 959 (2023) 170556