#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "get_next_line.h"

int		main(int ac, char **av)
{
	char	*line;
	int		fd;

	fd = 0;
	if (ac > 1)
	{
		fd = open(av[1], O_RDONLY);
	}
	while (1)
	{
		line = get_next_line(fd);
		if (!line)
		{
			break ;
		}
		printf("%s", line);
		free(line);
	}
	if (line)
		free(line);
}
