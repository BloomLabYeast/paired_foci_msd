function Rc = calc_Rc(coord_mat)

xmean = mean(mean(coord_mat(:,1,:)));
ymean = mean(mean(coord_mat(:,2,:)));
sqxdiff = mean(squeeze(squeeze((coord_mat(:,1,:)-xmean).^2)));
sqydiff = mean(squeeze(squeeze((coord_mat(:,2,:)-xmean).^2)));
sqdr0 = sqrt(squeeze(squeeze(xmean)).^2 +squeeze(squeeze(ymean).^2));
xvar = var(coord_mat(:,1,:));
xvar = squeeze(squeeze(xvar));
yvar = var(coord_mat(:,2,:));
yvar = squeeze(squeeze(yvar));
totvar = vertcat(xvar, yvar);
sigmasq  = mean(totvar);
Rc = (5/4)*sqrt(((2*sigmasq)+sqdr0));
