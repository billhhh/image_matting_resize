function UszImg = Upsize (I,IOrg)

           [row,col,layer] = size(IOrg);
           
           for i = 1:row
              for j = 1:col
                  for k = 1:layer
                      ResImg(i*2-1,j*2-1,k) = IOrg(i,j,k);
                      ResImg(i*2-1,j*2,k) = IOrg(i,j,k);
                      ResImg(i*2,j*2-1,k) = IOrg(i,j,k);
                      ResImg(i*2,j*2,k) = IOrg(i,j,k);
                  end
              end
           end
           
           [Irow,Icol] = size(I);
           if mod(Irow,2)~=0 %odd
               %del one row
               IOrg(row,:)=[];
           end
           
           if mod(col,2)~=0 %odd
               %del one col
               IOrg(:,col)=[];
           end
            
          %% Return The results -------------------------------------------
          
               UszImg = ResImg ; 

          
          % ---------------------------------------------------------------
            
            
    end