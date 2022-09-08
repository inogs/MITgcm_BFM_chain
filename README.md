# MITgcm_BFM_chain
Relocatable operational system for ocean physics and biogeochemistry developed in the framework of the Sharemed project

## New Installation Script

The installation of the chain relies on the script called `mit_setup_chain.ksh`. In order to run it one must se properly the `mit_profile__machine.src_inc`, where `machine` is the name of the host, as set up in `MIT_HOSTNAME` variable.

This configuration script one must set some variables and run some commands, depending on the machine. Now we will explain the structure of this file so that the installer can configure it with ease.

### Variables

- `MIT_NETCDF_PATH`: is the path of folder containing `NetCDF` library on the machine. (One can locate easily, for instance, loading the proper module, and spotting the folder in the `LD_LIBRARY_PATH` env variable)

- `MIT_DATE_PATH`: the path of `date` command. (Almost certainly will be `/usr/bin/date`)

- `MIT_NCKS_PATH`: the path of `ncks` on the machine.

- `MIT_NCFTPGET_PATH`: the path of `ncftpget` on the machine.

- `MITGCMUV_PATH`: the path of the executable produced in the compilation of the model. This will be located in the `MITGCM_BUILD` subfolder of the model folder.

- `MOTUCLIENT_UNPACK_DIR`: a path where `motuclient` will be unpacked. (Usually set to `$MIT_BINDIR/motuclient`)

- `PYTHON3_PATH`: the path of a valid `python3` interpreter. It is used just to create virtual environment, the the interpreter included in this environment will be used.

### Functions
- `mit_mkdir <dir>` (already present): create the directory `<dir>` with all its parents and check for the success.

- `symlink_if_not_present <path> <link>`: symbolic links the `<path>` to `<link>` if `<link>` is not already present. If it is, the function does nothing. If `<path>` it not present it returns an error state.

- `clone_or_update <git_link> <path> <branch>`: if `<path>` is not present, it clones the `<git_link>` repo to `<path>` checking out branch `<branch>`. (Notice if `<path>` is present it does nothing, the 'update' part is still to implement).

- `download_and_unpack <url> <path> <filename> <extraction_dir>`: downloads file at `<url>` placing it to `<path>/<filename>`. Then it creates the directory `<extraction_dir>` and extract the contents to it. If some step fail the function returns an error status.

- `set_python_environment <pyhton3_path> <requirements>`: uses `<python3_path>` to create an environment according to the variable `$MIT_VENV_1` (set in `mit_profile.src_inc`). Then it activate the environment, and uses `pip` to install all the requirements specified in `<requirements>`. (The python3 path is set for convenience the the variable `PYTHON3_PATH`.The requirements are listed in the file `$MIT_HOME/requirements.txt`).

Notice that all the function above are idempotent up to an upgrade coming from online repositories. This means that a script containing these function can safely executed $n$ times without spoiling the setup.

### Commands

Although the precise command depends on the specific machine (i.e. modules to load, particular env variable to set the structure of the file is the following):

```
# env variable section
mit_batch_prex "export LD_LIBRARY_PATH=${MIT_LIBDIR}:${MIT_NETCDF_PATH}:${LD_LIBRARY_PATH}"
mit_batch_prex "mit_mkdir $MIT_BINDIR"

# symlink section
mit_batch_prex "symlink_if_not_present $MIT_DATE_PATH $MIT_BINDIR/date"
mit_batch_prex "symlink_if_not_present $MIT_NCKS_PATH $MIT_BINDIR/ncks"
mit_batch_prex "symlink_if_not_present $MIT_NCFTPGET_PATH $MIT_BINDIR/ncftpget"
mit_batch_prex "symlink_if_not_present $MITGCMUV_PATH $MIT_BINDIR/mitgcmuv"

# git section
mit_batch_prex "clone_or_update $MIT_BITSEA_REPO $MIT_BITSEA $MIT_BITSEA_BRANCH"
mit_batch_prex "clone_or_update $MIT_POSTPROC_REPO $MIT_POSTPROCDIR $MIT_POSTPROC_BRANCH"
mit_batch_prex "clone_or_update $MIT_BC_IC_REPO $MIT_BC_IC_FROM_OGSTM_DIR $MIT_BC_IC_BRANCH"

# motuclient section
mit_batch_prex "download_and_unpack $MIT_MOTUCLIENT_URL $MIT_BINDIR motuclient.tar.gz $MOTUCLIENT_UNPACK_DIR"
mit_batch_prex "symlink_if_not_present $MOTUCLIENT_UNPACK_DIR/src/python $MIT_BINDIR/motuclient-python"

# python3 section
mit_batch_prex "set_python_environment $PYTHON3_PATH $MIT_HOME/requirements.txt"

# module section
# ad libitum
```