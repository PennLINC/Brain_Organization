
clear
Folder = '/data/jux/BBL/projects/pncSingleFuncParcel/scripts/Analysis/Corr_PrincipleGradient_EE_Myelin';
MeanCBF_Image = [Folder '/MeanCBF/n1172_AslMean_gamBeta_Intercept_MNI.nii.gz'];
% lh
cmd = ['mri_vol2surf --mov ' MeanCBF_Image ' --mni152reg --hemi lh --trgsubject fsaverage5 --o ' ...
      Folder '/MeanCBF/lh.MeanCBF.fsaverage5.mgh --projfrac 0.5 --interp trilinear'];
system(cmd);
% rh
cmd = ['mri_vol2surf --mov ' MeanCBF_Image ' --mni152reg --hemi rh --trgsubject fsaverage5 --o ' ...
      Folder '/MeanCBF/rh.MeanCBF.fsaverage5.mgh --projfrac 0.5 --interp trilinear'];
system(cmd);

% Write the lh.MeanCBF.fsaverage5 into a gifti file for visualization
MeanCBF_fsaverage5 = MRIread([Folder '/MeanCBF/lh.MeanCBF.fsaverage5.mgh']);
V_lh = gifti;
V_lh.cdata = MeanCBF_fsaverage5.vol';
V_lh_File = [Folder '/MeanCBF/lh.MeanCBF.fsaverage5.func.gii'];
save(V_lh, V_lh_File);

% Then, write the rh.MeanCBF.fsaverage5 into a gifti file for visualization
MeanCBF_fsaverage5 = MRIread([Folder '/MeanCBF/rh.MeanCBF.fsaverage5.mgh']);
V_rh = gifti;
V_rh.cdata = MeanCBF_fsaverage5.vol';
V_rh_File = [Folder '/MeanCBF/rh.MeanCBF.fsaverage5.func.gii'];
save(V_rh, V_rh_File);

cmd = ['wb_command -cifti-create-dense-scalar ' Folder '/MeanCBF/MeanCBF.fsaverage5' ...
       '.dscalar.nii -left-metric ' V_lh_File ' -right-metric ' V_rh_File];
system(cmd);
