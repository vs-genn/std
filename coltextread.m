function varargout = coltextread(fname, delim)
    %% https://stackoverflow.com/questions/5301419/how-do-i-read-a-delimited-file-with-strings-numbers-with-octave

    % Initialize the variable output argument
    varargout = cell(nargout, 1);

    % Initialize elements of the cell array to nested cell arrays
    % This syntax is due to {:} producing a comma-separated 
    [varargout{:}] = deal(cell());

    fid = fopen(fname, 'r');
    nl = 0;
    while true
        % Get the current line
        ln = fgetl(fid);
        nl = nl + 1; 
         
        % Stop if EOF
        if ln == -1
            break;
        endif

        % Split the line string into components and parse numbers
        elems = strsplit(ln, delim);
        nums = str2double(elems);
        
        if length(nums) != nargout
           disp(nl);
           disp(elems);
           nums = [nums(1:4) [9 9 9 9 9 9 9 9 9 9]];
           elems = [elems(1:4) elem2(5:14)];
        else
           num2 = nums;
           elem2 = elems;
        endif

        nans = isnan(nums);

        % Special case of all strings (header line)
        if all(nans)
            continue;
        endif

        % Find the indices of the NaNs 
        % (i.e. the indices of the strings in the original data)
        idxnans = find(nans);

        % Assign each corresponding element in the current line
        % into the corresponding cell array of varargout
        for i = 1:nargout
            % Detect if the current index is a string or a num
            if any(ismember(idxnans, i))
                varargout{i}{end+1} = elems{i};
            else
                varargout{i}{end+1} = nums(i);
            endif
        endfor
    endwhile

endfunction