function kill_ProgressBar()
%KILL_PROGRESSBAR kills remaining timing objects that may have been created
%by ProgressBar (https://github.com/JAAdrian/MatlabProgressBar)

delete(timerfindall('Tag', 'ProgressBar'));

end

