using Plots

# Define parameters
max_iter = 100
x_range = range(-2.0, stop=1.0, length=1000)
y_range = range(-1.5, stop=1.5, length=1000)

# Initialize matrix
mandelbrot_set = Array{Int}(undef, length(x_range), length(y_range))


# Zn+1 = Z^2 n + C, with Z0 = 0
# Compute Mandelbrot set
for (i, x) in enumerate(x_range)
    for (j, y) in enumerate(y_range)
        c = complex(x, y)
        z = 0.0 + 0.0im
        count = 0
        while abs(z) <= 2 && count < max_iter
            z = z^2 + c
            count += 1
        end
        mandelbrot_set[i, j] = count
    end
end

# Plot the result
heatmap(
    x_range, y_range, mandelbrot_set',
    color = cgrad(:inferno),
    aspect_ratio = 1,
    title = "Mandelbrot Set"
)
