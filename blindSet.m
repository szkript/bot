%% set big blind coordinate

w.bigBlind = 180;
h.bigBlind = 80;
% works with :cashtable,tournament
%%
if isempty(config.bigBlind)  
  
    asd = imcrop(new, [120 18 1800 h.bigBlind]);
    
    o = asd;
%                 o = rgb2gray(o);
%                 imname = 'fortrain/fejlec12.jpg';
%                 imwrite(o,imname);
    
    
    asd=ocr(o,'Language','trainedData/fejlec/tessdata/fejlec.traineddata');   
    
    asd=asd.Words;
    if size(asd,1) > 4
%         disp(asd);
        for i = 1:size(asd,1)
            
            if strcmp(asd{i},'USD')
                blindcell = i-1;
                break;
            end
            if strcmp(asd{i},'Play')
                blindcell = i-1;
                break;
            end
            if strcmp(asd{i},'Blinds')
                blindcell = i+1;
                break;
            end
        end
        if exist('blindcell','var')
            blinds = asd{blindcell};
            blinds = strrep(blinds,'$','');
            blinds = strrep(blinds,'/',' ');

            a = 1;
            for i= 1 : length(blinds)
                if strcmp(blinds(i),' ')
                    break;
                end
            end
            for o = 1:length(blinds)-i
                i = i+1;
                bigBlind(o) = blinds(i);

            end
            config.bigBlind = str2num(bigBlind);
    %         read.bigBlind = [];
            disp(config.bigBlind);
                    
        end
    end
end

