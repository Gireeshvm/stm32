In previous program we looped over all led for a regular interval. <br/>
In this we are going to use builtin user button to control and loop over all led's

- USER button B1 is connected to PC13 so we need to configure pin 13 as input
- By default B1 is pulled down, so we configure PC13 as pull-down input
- Default red led will be on on pressing B1 it will be pulled high so we turn on blue led
