
clear
Folder = '/data/jux/BBL/projects/pncSingleFuncParcel/scripts/Analysis/Corr_PrincipleGradient_EE_Myelin';
% lh
AllometricScaling_fsaverage6_lh = load([Folder '/AllometricScaling/lh.PNC20_allometric_scaling_fsaverage6.txt']);
fnum = 81920;
fname = [Folder '/AllometricScaling/lh.AllometricScaling_fsaverage6'];
write_curv(fname, AllometricScaling_fsaverage6_lh, fnum);

cmd = ['mri_surf2surf --hemi lh --srcsubject fsaverage6 --srcsurfval ' ...
       Folder '/AllometricScaling/lh.AllometricScaling_fsaverage6 --src_type ' ...
       'curv --trgsubject fsaverage5 --trgsurfval ' Folder ...
       '/AllometricScaling/lh.AllometricScaling_fsaverage5 --trg_type curv'];
system(cmd);

% Then, write the lh.AllometricScaling_fsaverage5 into a gifti file for visualization
AllometricScaling_fsaverage5 = read_curv([Folder '/AllometricScaling/lh.AllometricScaling_fsaverage5']);
V_lh = gifti;
V_lh.cdata = AllometricScaling_fsaverage5;
V_lh_File = [Folder '/AllometricScaling/lh.AllometricScaling_fsaverage5.func.gii'];
save(V_lh, V_lh_File);

% rh
AllometricScaling_fsaverage6_rh = load([Folder '/AllometricScaling/rh.PNC20_allometric_scaling_fsaverage6.txt']);
fnum = 81920;
fname = [Folder '/AllometricScaling/rh.AllometricScaling_fsaverage6'];
write_curv(fname, AllometricScaling_fsaverage6_rh, fnum);

cmd = ['mri_surf2surf --hemi rh --srcsubject fsaverage6 --srcsurfval ' ...
       Folder '/AllometricScaling/rh.AllometricScaling_fsaverage6 --src_type ' ...
       'curv --trgsubject fsaverage5 --trgsurfval ' Folder ...
       '/AllometricScaling/rh.AllometricScaling_fsaverage5 --trg_type curv'];
system(cmd);

% Then, write the rh.AllometricScaling_fsaverage5 into a gifti file for visualization
AllometricScaling_fsaverage5 = read_curv([Folder '/AllometricScaling/rh.AllometricScaling_fsaverage5']);
V_rh = gifti;
V_rh.cdata = AllometricScaling_fsaverage5;
V_rh_File = [Folder '/AllometricScaling/rh.AllometricScaling_fsaverage5.func.gii'];
save(V_rh, V_rh_File);
