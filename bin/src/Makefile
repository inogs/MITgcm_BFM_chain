SHELL		= /bin/ksh
include CONFIG/Make.config

SCRIPTS=	cvs_check.ksh					\
		mit_archive.ksh					\
		mit_check_input_files.ksh			\
		mit_get.ksh					\
		mit_input_files.inc				\
		mit_log_inspect.py				\
		mit_link_analyses.ksh				\
		mit_link_forecast.ksh				\
		mit_input_stagein.ksh				\
		mit_model.ksh					\
		mit_model__phase_B1.ksh				\
		mit_model__phase_B2.ksh				\
                mit_model__phase_B3.ksh                         \
		mit_model_wrapper.ksh				\
		mit_mon.ksh					\
		mit_mpi.inc					\
		mit_mpi__mpich.inc				\
		mit_mpi__poe.inc				\
		mit_mpi__openmpi.inc				\
		mit_mpi__intelmpi.inc				\
		mit_post_wrapper.ksh				\
		mit_postproc.ksh				\
		mit_postproc__phase_C1.ksh			\
		mit_postproc__phase_C2.ksh			\
		mit_pre_wrapper.ksh				\
		mit_preproc.ksh					\
		mit_preproc__phase_A1.ksh			\
		mit_preproc__phase_A2.ksh			\
		mit_profile.inc					\
		mit_profile__g100.inc				\
		mit_profile__fluxus.inc				\
		mit_rm.inc					\
                mit_rm__slurm.inc				\
		mit_job.ksh					\
		mit_run_setup.ksh				\
		mit_setup_crontab.ksh				\
		mit_setup_environment.ksh			\
		mit_setup_directories.ksh			\
		mit_setup_static_data.ksh			\
		mit_log_job.ksh					\
		mit_start.ksh					\
		mit_submit.ksh					\
		mit_postcheckout.ksh				\
		mit_check_run.ksh				\
		mit_parse_reports.ksh				\
		mit_recovery.ksh				\
		mit_add_binaries.ksh				\
		mit_test_rundate_options.ksh			\
		mit_search_nans.ksh				\
		mit_restart_cp.ksh				\
		mit_clean.ksh					\
		mit_cleaner.ksh					\
		mit_lists.inc					\
		mit_test_lists.ksh				\
		mit_dates.inc					\
		mit_test_dates.ksh				\
		mit_domain_decomposition.ksh			\
		mit_is_login_node.ksh				\
		mit_check_remote_cron.ksh			\
        mit_cmems_downloader.ksh             \
        mit_clim_downloader.ksh              \
 


default:	compile

include CONFIG/Make.check

compile:	check $(SCRIPTS)

install:	check $(SCRIPTS)
		-@echo "Installing files:"
		@for script in $(SCRIPTS) ; do										\
			type=$$( echo $$script | awk 'BEGIN{FS="."}{if(NF > 1){print($$NF)}else{print ""}}');		\
			if [[ $$type = 'ksh' || $$type = 'bash' || $$type = 'py' || $$type = 'pl' || $$type = ''  ]] ; then		\
				dirs="$(INST_KSHDIR)";									\
				m="$(INST_KSHMOD)";									\
			elif [[ $$type = 'inc' ]] ; then								\
				dirs="$(INST_INCDIR)";									\
				m="$(INST_INCMOD)";									\
			else												\
				echo "ERROR: type <$$type>";								\
				return 1;										\
			fi;												\
			for d in $$dirs ; do										\
				if [[ ! -d $$d ]] ; then								\
					mkdir -p $$d;									\
				fi;											\
				if cmp $$script $$d/$$script 1>/dev/null 2>&1; then					\
					echo "script: <$$script>, type: <$$type> - SKIPPED";				\
					echo "origin: <./$$script>, target: <$$d/$$script>";				\
				else											\
					echo "script: <$$script>, type: <$$type>";					\
					if [ -f $d/$$script ] ; then							\
						chmod u+w $$d/$$script;							\
					fi;										\
					echo "	 *** cp -f $$script $$d";						\
					cp -f $$script $$d;								\
					echo "chmod $$m $$d/$$script";							\
					chmod $$m $$d/$$script;								\
				fi;											\
			done;												\
		done;

clean:		check
		rm -f $(SCRIPTS)




.SUFFIXES: .src_ksh .ksh .src_inc .inc .src_py .py .src_pl .pl

.src_py.py:		$(COMPILER)
			-@[[ -f $@ ]] && chmod u+w $@ 2>/dev/null || return 0
			$(COMPILER) $< $@
			chmod $(COMP_PYMOD) $@
			chmod $(SRC_PYMOD) $<

.src_pl.pl:		$(COMPILER)
			-@[[ -f $@ ]] && chmod u+w $@ 2>/dev/null || return 0
			$(COMPILER) $< $@
			chmod $(COMP_PLMOD) $@
			chmod $(SRC_PLMOD) $<

.src_ksh.ksh:		$(COMPILER)
			-@[[ -f $@ ]] && chmod u+w $@ 2>/dev/null || return 0
			$(COMPILER) $< $@
			chmod $(COMP_KSHMOD) $@
			chmod $(SRC_KSHMOD) $<

.src_inc.inc:		$(COMPILER)
			-@[[ -f $@ ]] && chmod u+w $@ 2>/dev/null || return 0
			$(COMPILER) $< $@
			chmod $(COMP_INCMOD) $@
			chmod $(SRC_INCMOD) $<

