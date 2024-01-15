---
layout: post
title: Raytracing
categories: blog
---

I was lamenting on Discord about having never found an on-ramp for linear algebra despite learning it several times over, and someone recommended [The Ray Tracer Challenge](http://raytracerchallenge.com/) by Jamis Buck.

It starts all the way from the bottom, from tuples to points and vectors and matrices, but doesn't really get bogged down in the math a whole lot, which was what the entirety of linear algebra was like for me through high school and college.  I even somehow slogged my way through a computer graphics class in college that probably followed the same curriculum in this book.  By the time we got to any actual graphics work in that class, I was already mentally checked out having had to hand-compute matrix products and determinants.  Not to mention, the class was held in C for a program that was taught primarily in Java.

However, Buck moves with a quick "let's just go through this once and move on" pace and doesn't take his time getting to why all these concepts are useful.  This time around, I'll be writing in Python.  In addition, rather than implementing all the transformations by the book, I'm just going to take advantage of the power of [NumPy](https://numpy.org/), another thing I hadn't really gotten too deeply into for lack of practical applications.

I swear, once I make it all the way through this book, I'll come back and do a few more of these by hand, but for now this stuff is actually pretty exciting and I have made my first computer-generated image file since college:

![projectile](/assets/projectile.png)

```
def projectiles():
    height = 400
    width = 400 
    canvas = np.zeros((height, width, 3))
    
    for magnitude in range(4,100):
        start = np.array((0,1,0))
        velocity = np.array((1,1.8,0)) 
        velocity = (velocity / np.linalg.norm(velocity)) * magnitude* .2
        p_pos = start
        p_vel = velocity
        env_grav = np.array((0,-0.1,0))
        env_wind = np.array((-0.04, 0, 0))

        while p_pos[0] >= 0:
            #tick
            p_pos = p_pos + p_vel
            p_vel = p_vel + env_grav + env_wind

            #print(p_pos)
            ppm.write_pixel(canvas, int(p_pos[0]), height - int(p_pos[1]), ppm.RED)

    ppm.write_ppm(canvas, "projectile.ppm")
```

Anyway, that was just for outputting 2D files.  I'm still working my way through 4x4 matrices before I get to the fun 3D stuff.

Also I did write the file output myself.  The book works in PPM files, which are just plain text files, and quite handy for debugging.


