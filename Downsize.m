function DszImg = Downsize (IOrg)

           [row,col,layer] = size(IOrg);
           %ResImg = [];
           
           for i = 1:2:row
              for j = 1:2:col
                  for k = 1:layer
                      %fprintf('i: %d\n',i);
                      ResImg((i+1)/2,(j+1)/2,k) = IOrg(i,j,k);
                  end
              end
           end
               
            
          %% Return The results -------------------------------------------
          
               DszImg = ResImg ; 

          
          % ---------------------------------------------------------------
            
            
    end