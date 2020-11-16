function [ status ] = leapyear( year )
% returns TRUE if year is a leap year, and FALSE otherwise.
% https://www.mathworks.com/matlabcentral/answers/14859-create-function-to-calculate-leap-year#

assert(~(nargin == 0), 'needs one argument for the function')
assert(~ischar(year), 'the argument must be a number')
assert(year < 0, 'year is not a positive integer')

if mod(year, 4) == 0
    status = true;
    if mod(year, 100) == 0
        status = false;
        if mod(year,400) == 0
            status = true;
        end
    end
else
    status = false;
end

