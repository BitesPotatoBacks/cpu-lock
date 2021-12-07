
#import <Foundation/Foundation.h>

int main(int argc, char * argv[])
{
    @autoreleasepool
    {
        int arg;
        
        NSTask *command = [[NSTask alloc] init];
        [command setQualityOfService: NSQualityOfServiceBackground];
        [command setLaunchPath: @"/bin/bash"];
        [command setArguments: @[@"-c", @"echo Please insert a command to run."]];

        while((arg = getopt(argc, argv, "epl:c:h")) != -1)
        {
            switch(arg)
            {
                case 'e':
                    [command setQualityOfService: NSQualityOfServiceBackground];
                    break;
                case 'p':
                    [command setQualityOfService: NSQualityOfServiceUserInitiated];
                    break;
                case 'l':
                    [command setLaunchPath: [NSString stringWithFormat: @"%s", optarg]];
                    break;
                case 'c':
                    [command setArguments: @[@"-c", [NSString stringWithFormat: @"%s", optarg]]];;
                    break;
                case 'h':
                    printf("%s [options]\n", argv[0]);
                    printf("    -e           : lock command to effeciency cores (default)\n");
                    printf("    -p           : lock command to performance cores\n");
                    printf("    -l <string>  : set command launch path (default is \"/bin/bash\")\n");
                    printf("    -c <string>  : insert command to run\n");
                    printf("    -h           : help\n");
                    return 0;
                    break;
            }
        }
        
        [command launch];
        [command waitUntilExit];
    }
    return 0;
}
