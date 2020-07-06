#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int		get_next_line(int fd, char **line);

int		main(int ac, char **av)
{
	char	*line;
	int		fd = 0;
	int 	ret;

	if (ac > 1)
	{
		fd = open(av[1], O_RDONLY);
	}
	while (1)
	{
		ret = get_next_line(fd, &line);
		if (ret == -1)
		{
			break ;
		}
		else
		{
			if (ret == 0)
			{
				break ;
			}
			printf("%s\n", line);
		}
		free(line);
	}
	// for leaks command
	// while(1){}
}
