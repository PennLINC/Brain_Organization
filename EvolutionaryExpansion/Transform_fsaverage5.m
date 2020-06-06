
clear
Folder = '/data/jux/BBL/projects/pncSingleFuncParcel/scripts/Analysis/Corr_PrincipleGradient_EE_Myelin';
Evo_fsaverage6_rh = load([Folder '/EvolutionaryExpansion/Hill2010_evo_fsaverage6.txt']);
fnum = 81920;
fname = [Folder '/rh.Hill2010_evo_fsaverage6'];
write_curv(fname, Evo_fsaverage6_rh, fnum);

cmd = ['mri_surf2surf --hemi rh --srcsubject fsaverage6 --srcsurfval ' ...
       Folder '/EvolutionaryExpansion/rh.Hill2010_evo_fsaverage6 --src_type ' ...
       'curv --trgsubject fsaverage5 --trgsurfval ' Folder ...
       '/EvolutionaryExpansion/rh.Hill2010_evo_fsaverage5 --trg_type curv'];
system(cmd);

% Then, write the rh.Hill2010_evo_fsaverage5 into a gifti file for visualization
Evo_fsaverage5 = read_curv([Folder '/EvolutionaryExpansion/rh.Hill2010_evo_fsaverage5']);
V_rh = gifti;
V_rh.cdata = Evo_fsaverage5;
V_rh_File = [Folder '/EvolutionaryExpansion/rh.Hill2010_evo_fsaverage5.func.gii'];
save(V_rh, V_rh_File);
