#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "get_next_line.h"

int	main(int ac, char **av)
{
	char	*line;
	int		fd1 = 0;
	int		fd2 = 0;
	int		fd3 = 0;
	int		fd4 = 0;

	if (ac > 1)
	{
		fd1 = open(av[1], O_RDONLY);
		fd2 = open(av[2], O_RDONLY);
		fd3 = open(av[3], O_RDONLY);
		fd4 = open(av[4], O_RDONLY);
	}
	//fd1---------------------------------//
	line = get_next_line(fd1);
	printf("fd=%d : %s", fd1, line);
	if (!line)
		printf("\n");
	//fd1---------------------------------//
	line = get_next_line(fd1);
	printf("fd=%d : %s", fd1, line);
	if (!line)
		printf("\n");
	//fd which dosen't not exitst------//
	line = get_next_line(fd4);
	printf("fd=%d : %s", fd4, line);
	if (!line)
		printf("\n");
	//fd2---------------------------------//
	line = get_next_line(fd2);
	printf("fd=%d : %s", fd2, line);
	if (!line)
		printf("\n");
	//fd3---------------------------------//
	line = get_next_line(fd3);
	printf("fd=%d : %s", fd3, line);
	if (!line)
		printf("\n");
	//fd1---------------------------------//
	line = get_next_line(fd1);
	printf("fd=%d : %s", fd1, line);
	if (!line)
		printf("\n");
}
