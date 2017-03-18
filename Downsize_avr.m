function DszImg = Downsize_avr (IOrg)

           [row,col,layer] = size(IOrg);
           
           if mod(row,2)~=0 %odd
               %add one row
               IOrg(row+1,:)=0;
           end
           
           if mod(col,2)~=0 %odd
               %add one col
               IOrg(:,col+1,:)=0;
           end
           
           for i = 1:2:row
              for j = 1:2:col
                  for k = 1:layer % k=1,2,3表示分别对R,G,B三通道
                      pixel_avr = (uint16(IOrg(i,j,k))+uint16(IOrg(i,j+1,k))+uint16(IOrg(i+1,j,k))+uint16(IOrg(i+1,j+1,k)))/4;
                      ResImg((i+1)/2,(j+1)/2,k) = uint8(pixel_avr);
                  end
              end
           end
           
          %% Return The results -------------------------------------------
          
               DszImg = ResImg ; 

          
          % ---------------------------------------------------------------
            
            
    end