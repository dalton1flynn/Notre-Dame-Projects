#Project Overview

Below is the reflection I wrote on this project during the spring of my freshman year:

  For our open-ended project, my group decided to model and build a counter-current heat exchanger. After working out the details of the 
  exchanger, our design statement became as follows: "The group will build a countercurrent heat exchanger with two concentric pipes to 
  cool down 20℃ water to 10℃. The GUI program created by the group will be able to separately calculate both the expected final 
  temperatures of the fluids passing through the exchanger based on the length of the exchanger and the length of heat exchange surface 
  necessary to achieve a desired final temperature."

  Our group used 2 methods to model the heat transfer between two fluids moving past each other on opposite sides of a conductive surface. 
  First, we used an energy balance, breaking up the pipes into many small pieces and calculating the energy flowing into and out of each 
  piece. We utilized Euler's method to calculate how the temperature changed over time in the final piece of each pipe. This method allowed
  us to calculate expected final temperatures based on a certain length of heat transfer surface. Our next method took advantage of heat 
  transfer equations, such as qdot=U*A*deltaT and q=c*mdot*deltaT. With the fact that A=2*pi*r*L (where L=length), we could calculate the 
  length of exchanger necessary to achieve a desired final temperature. I was heavily involved in developing these models for our group, 
  and I wrote two programs that we eventually used in our GUI using these methods. I have attached these programs at the bottom.

  However, one problem persisted throughout our modeling efforts. We could not determine the overall heat transfer coefficient using theory
  (both because it is far beyond our knowledge of heat transfer and because this coefficient would not account for all of the error in our 
  set-up). So, we had to make an educated guess, and then determine it experimentally once we had built a prototype exchanger. When we did
  determine this coefficient, our model worked well, and we were able to achieve an average final temperature of 9.9℃, very close to our 
  goal of 10℃.

  Our GUI performs the calculations of each of the two methods described above. It takes many inputs (such as radii, volumetric flow rates,
  the type of fluid, initial temperatures, etc.) to define the system the user is working with. Screen shots of our GUI and phyiscal
  heat exchanger are included in figures within this folder.
