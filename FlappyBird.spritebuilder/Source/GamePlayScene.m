#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    character=(Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    timeSinceObstacle=0.0f;
    [self addObstacle];
}

-(void)update:(CCTime)delta
{
   //incrementing time since last obstacle was added
    timeSinceObstacle +=delta;
    
    //check if 2 seconds has passed to add objstacle
    if(timeSinceObstacle>2.0f)
        [self addObstacle];

    timeSinceObstacle=0.0f;

}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    [character flap];
}
@end
