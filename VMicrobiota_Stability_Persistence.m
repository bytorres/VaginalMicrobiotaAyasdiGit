%This codes calculates a stability score. 

sID=unique(subjectID);
subject_idx=cell(size(sID,1),10);

for i=1:size(sID,1)
    
    subject_idx{i,1}=find(subjectID==(sID(i))); %Organize Subject Data by Day
    subject_idx{i,2}=Angle(subject_idx{i}); % Index the angle and store 
    
    %% Angle Difference
    for j=1:size(subject_idx{i,2},1)
        
        if j+1 < size(subject_idx{i,2},1)
            subject_idx{i,3}(j)=subject_idx{i,2}(j+1)-subject_idx{i,2}(j);
        end
    end
    %% Stability Score
    % Angle Difference is less than a set threshold
    for k=1:size(subject_idx{i,3},2)
        
        if abs(subject_idx{i,3}(k))<=3
            
            subject_idx{i,4}(k)=1;
        else
            subject_idx{i,4}(k)=0;
            
        end
        
        
    end

    a= subject_idx{i,4};
    subject_idx{i,5}=strfind([0,a,0],[1 0]) - strfind([0,a,0],[0 1]);
    subject_idx{i,6}=size(find(subject_idx{i,5}(:)>=2),1);% # of Stable groups
    subject_idx{i,7}=sum(find(subject_idx{i,5}(:)>=2));
    subject_idx{i,8}=sum(double(subject_idx{i,4}==0));% Sum Unstable points
    subject_idx{i,9}=sum(double(subject_idx{i,4}==1));% Sum Stable points
end



