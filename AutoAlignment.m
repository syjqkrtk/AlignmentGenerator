for i = 7965:9354
    str = sprintf("D:\\Download\\DataBase\\MTgenome\\MTgenome%d.txt",i);
    disp(str);
    
    file = fopen('param.txt','w');
    fprintf(file,'INPUT_FILE	%s	// input file name (name size limit: 256)\n',str);
    fprintf(file,'WORD_SIZE	6		// WORD size (W, supported to 16 )\n');
    fprintf(file,'ALLOW_SIZE	0		// allowable size per word (m, suport 0 or 1)\n');
    fprintf(file,'SPACE_SIZE	0		// SPACE size (SP)\n');
    fprintf(file,'MIN_SEED_LEN	12		// minimum length to be a seed (L)\n');
    fprintf(file,'SCORE_MAT	1		// match score (integer)\n');
    fprintf(file,'SCORE_MIS	-2		// mismatch score (integer)\n');
    fprintf(file,'SCORE_THR	-10		// score threshold (in ungapped extension)\n');
    fprintf(file,'GREEDY_X	30		// value of X in greedy algorithm (in gapped extension)\n');
    fprintf(file,'GREEDY_MIN_L	-10240		// maximum value of insertion\n');
    fprintf(file,'GREEDY_MAX_U	10240		// maximum value of deletion\n');
    fprintf(file,'WD_SIZE		30		// window size for filtering\n');
    fprintf(file,'T_THR		0.6		// threshold for filtering\n');
    fclose(file);
    
    file = fopen('param2.txt','w');
    fprintf(file,'REM_FILE	D:\\Download\\program_reminer_용준\\REMiner2\\x64\\Release\\MTgenome_%d.rem	// rem file\n',i);
    fprintf(file,'MAX_DIFF	20000		// 최대 차이값\n');
    fprintf(file,'SEQ_LINE	60		// seq를 보여주는 라인 길이\n');
    fprintf(file,'ALIGN_PATH	D:\\Download\\program_reminer_용준\\AlignmentGenerator\\x64\\Release\\MTgenome_%d		// alignment 결과파일을 생성할 디렉토리\n',i);
    fprintf(file,'ALIGN_SIZE	5000000		// alignment 결과파일 정리를 위한 기본 지역 크기\n');
    fprintf(file,'ALIGN_LENGTH	1000000		// alignment 결과파일 정리를 위한 기본 alignment 길이\n');
    fprintf(file,'ALIGN_MAX	1000000		// alignment 결과파일 정리를 위한 최대 alignment 길이\n');
    fclose(file);
    
    Str = sprintf('mkdir MTgenome_%d',i);
    dos(Str);
    Str = sprintf('AlignmentGenerator.exe',i);
    dos(Str);
    disp(i)
end