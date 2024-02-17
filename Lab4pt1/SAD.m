function SAD_value = SAD(Target_MB, Reference_candidate)
    Difference_matrix= abs(Target_MB - Reference_candidate);
    SAD_value= sum(Difference_matrix,'all');
end

