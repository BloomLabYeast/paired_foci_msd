function stat_coord_mat = calc_mean_var(coord_mat)

a = sqrt(coord_mat(:,1,:).^2 + coord_mat(:,2,:).^2);
b = mean(a(:));
c = var(a(:));

stat_coord_mat = [b c];