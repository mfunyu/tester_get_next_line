#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int		get_next_line(int fd, char **line);

int		main(int ac, char **av)
{
	char	*line;
	int		fd = 0;
	int		fd2 = 0;
	int		fd3 = 0;
	int		fd4 = 0;
	// int 	i = 0;
	int 	ret;

	if (ac > 1)
	{
		fd = open(av[1], O_RDONLY);
		fd2 = open(av[2], O_RDONLY);
		fd3 = open(av[3], O_RDONLY);
		fd4 = open(av[4], O_RDONLY);
	}
	// if (fd < 0)
	// 	printf("file name error\n");
	// while (1)
	// while (i++ < 23)
	// {
		ret = get_next_line(fd, &line);
		printf("fd=%d : %s", fd, line);
		printf("(%d)\n", ret);
		ret = get_next_line(fd, &line);
		printf("fd=%d : %s", fd, line);
		printf("(%d)\n", ret);
		ret = get_next_line(fd4, &line);
		printf("fd=%d : %s", fd4, line);
		printf("(%d)\n", ret);
		ret = get_next_line(fd2, &line);
		printf("fd=%d : %s", fd2, line);
		printf("(%d)\n", ret);
		ret = get_next_line(fd3, &line);
		printf("fd=%d : %s", fd3, line);
		printf("(%d)\n", ret);
		ret = get_next_line(fd, &line);
		printf("fd=%d : %s", fd, line);
		printf("(%d)\n", ret);
		// if (ret == -1)
		// {
		// 	printf("ret: %d (error ditected)\n", ret);
		// 	break ;
		// }
		// else
		// {
		// 	if (ret == 0)
		// 	{
		// 		break ;
		// 	}
		// 	printf("%s\n", line);
		// }
	// }
	// while(1){}
}
