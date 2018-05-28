function [BH, BMother] = createBH(H, HN);
%createBH Create a boundary topology
%
% DESCRIPTION:
%
%       Given topology H and its neighbourhood HN, will create
%       boundary topology BH.  Can also produce BMother which defines
%       index into H to which boundary element belongs to.  
%
%
% USAGE:
%       [BH, BMother] = createBH(H, createHN(H));
%       [BH, BMother] = createBH(H, HN);
%
% INPUTS:
%       H           - Topology matrix (see article)
%       HN          - Neighborhood topology matrix (see article)
%
% OUTPUTS:
%       BH          - Boundary topology matrix
%       BMother     - Vector in which each row defines an index in H to which the
%                     boundary element belongs to


[els, edge] = find(HN == 0);

BH = zeros(numel(els), 2);
BMother = zeros(size(BH, 1), 1);

for(el = 1 : length(BH))
  if(edge(el) == 1)
    BH(el, :) = H( els(el), [1 2]);
    BMother(el) = els(el);
  elseif(edge(el) == 2)
    BH(el, :) = H( els(el), [2 3]);
    BMother(el) = els(el);
  elseif(edge(el) == 3)
    BH(el, :) = H( els(el), [3 1]);
    BMother(el) = els(el);
  end
end;

%BH=sortBH(BH);

end

