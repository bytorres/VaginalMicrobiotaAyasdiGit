
%
%subjectID1=unique(subjectID); % remove NAN

n=0;
for i=1:size(subjectID1,1)

% Find the idx that contains the subject of interest
idx=find(subjectID==subjectID1(i));

%Figure out what AyasdiId that corresponds to
ayasdid=AyasdiId(idx);

%Plots Day 0 but put in a loop to plot all days
n=n+1;
subplot(5,5,n)

plot(x,y,'k.','MarkerSize',10)
number=72;
colours=colormap(parula(number+1));
for j=1:size(ayasdid,1)
    %ayasdid(j);
    [row,col]=find(M2==ayasdid(j));
     hold on
    plot(x(row),y(row),'.','MarkerSize',20,'color',colours(j,:))
    set(gca,'Ydir','reverse')
    set(gca,'Xdir','reverse')
    myString = sprintf('Subject %d', subjectID1(i));
    title(myString)
    hold all
end

end

