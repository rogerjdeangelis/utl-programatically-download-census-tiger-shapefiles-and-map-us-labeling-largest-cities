%let pgm=utl-utl-programatically-download-census-tiger-shapefiles-and-map-us-labeling-largest-cities-download-census-tiger-shapefiles-and-map-us-labeling-largest-cities;

Programmatically download a census tiger shapefile map of the us and label cities

The integration between tigris and sf allows R users to
easily obtain and work with Census geographic
data without manually downloading and importing shapefiles.
The process is streamlined, with tigris
handling the download and initial loading,
and sf providing the framework for
subsequent spatial data operations13.

  Two Solutions

          1 programmed download tiger files
            https://tinyurl.com/v434u79w
          2 related repos

output graphic
https://tinyurl.com/v434u79w
https://github.com/rogerjdeangelis/utl-programatically-download-census-tiger-shapefiles-and-map-us-labeling-largest-cities/blob/main/lower48.pdf

github
https://tinyurl.com/yudju4n3
https://github.com/rogerjdeangelis/utl-programatically-download-census-tiger-shapefiles-and-map-us-labeling-largest-cities

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/*     US States with Major Cities                     https://tinyurl.com/v434u79w                                       */
/*     Example of labeling points on a shapefile map                                                                      */
/*                                                                                                                        */
/*                                                                                                                        */
/*       Create a high resolution map of the US lower 48 atates                                                           */
/*       and pin the % largest cities                                                                                     */
/*                                                            _                                                           */
/*       ________________________                            / \                                                          */
/*       |     ||         |      |------ _  _           ____(  _)                                                         */
/*       |     |(         |      |    /_/ \// _        / | || /                                                           */
/*       |_____| \        |------|   /  --\/ / \    __/  | /|(                                                            */
/*       |     |  \_------|      |   \_   | (  (   /     |/_|/                                                            */
/*       |     |    |     |______|_____\ _|Chicago/ ___ _|_|/                                                             */
/*       (_____|____|     |       \     \ \_)------/   ) ) New York                                                       */
/*       |   |    | |_____|__      )____/  |  |    |___)/                                                                 */
/*       (   |    |    |     |_____|    \  |  /---/\__  \                                                                 */
/*       )   |    |    |     |      \    \ )_/    \ / \_/                                                                 */
/*       \   \    |    |     |       |    ||______//____|                                                                 */
/*        |   \   |____|_____|_______|----|       /      \                                                                */
/*        )    \  /    |    |___     |    /______/_____  /                                                                */
/*        \     \|     |    |  |     |   |   |   / \   \/                                                                 */
/*         \ LA  \  Phoenix |  |__   |---/   |   \  \  /                                                                  */
/*          \_   /     |    |     ---)   )   |   |   \/                                                                   */
/*            \__\_____|_----        \   |-|_|_---___/                                                                    */
/*                        \    Houston)__  |   \/\_  \                                                                    */
/*                         \_/\      /   --        )  \                                                                   */
/*                              \    /              \  (                                                                  */
/*                              \  (                |  |                                                                  */
/*                               \__\                \_|                                                                  */
/*                                                                                                                        */
/**************************************************************************************************************************/

%utlfkil(d:/pdf/lower48.pdf);

%utl_rbeginx;
parmcards4;
# Load required libraries
library(sf)
library(ggplot2)
library(tigris)

# Download US states shapefile
states <- states(cb = TRUE, resolution = "20m")

# Create a sample dataframe of cities with lat/long coordinates
cities <- data.frame(
  name = c("New York", "Los Angeles", "Chicago", "Houston", "Phoenix"),
  lat = c(40.7128, 34.0522, 41.8781, 29.7604, 33.4484),
  lon = c(-74.0060, -118.2437, -87.6298, -95.3698, -112.0740)
)

# Convert cities dataframe to sf object
cities_sf <- st_as_sf(cities, coords = c("lon", "lat"), crs = 4326)

# Ensure both layers have the same CRS
states <- st_transform(states, 4326)
# Create the map
pdf("d:/pdf/lower48.pdf");
ggplot() +
  geom_sf(data = states, fill = "white", color = "black") +
  geom_sf(data = cities_sf, color = "red", size = 3) +
  geom_sf_text(data = cities_sf, aes(label = name), nudge_y = 0.5, size = 3) +
  coord_sf(xlim = c(-125, -65), ylim = c(25, 50), expand = FALSE) +
  theme_minimal() +
  labs(title = "US States with Major Cities",
       subtitle = "Example of labeling points on a shapefile map",
       caption = "Data source: US Census Bureau")
pdf()
;;;;
%utl_rendx;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*     US States with Major Cities                                                                                        */
/*     Example of labeling points on a shapefile map                                                                      */
/*     https://tinyurl.com/v434u79w                                                                                       */
/*                                                                                                                        */
/*       Create a high resolution map of the US lower 48 atates                                                           */
/*       and pin the % largest cities                                                                                     */
/*                                                            _                                                           */
/*       ________________________                            / \                                                          */
/*       |     ||         |      |------ _  _           ____(  _)                                                         */
/*       |     |(         |      |    /_/ \// _        / | || /                                                           */
/*       |_____| \        |------|   /  --\/ / \    __/  | /|(                                                            */
/*       |     |  \_------|      |   \_   | (  (   /     |/_|/                                                            */
/*       |     |    |     |______|_____\ _|Chicago/ ___ _|_|/                                                             */
/*       (_____|____|     |       \     \ \_)------/   ) ) New York                                                       */
/*       |   |    | |_____|__      )____/  |  |    |___)/                                                                 */
/*       (   |    |    |     |_____|    \  |  /---/\__  \                                                                 */
/*       )   |    |    |     |      \    \ )_/    \ / \_/                                                                 */
/*       \   \    |    |     |       |    ||______//____|                                                                 */
/*        |   \   |____|_____|_______|----|       /      \                                                                */
/*        )    \  /    |    |___     |    /______/_____  /                                                                */
/*        \     \|     |    |  |     |   |   |   / \   \/                                                                 */
/*         \ LA  \  Phenix  |  |__   |---/   |   \  \  /                                                                  */
/*          \_   /     |    |     ---)   )   |   |   \/                                                                   */
/*            \__\_____|_----        \   |-|_|_---___/                                                                    */
/*                        \    Houston)__  |   \/\_  \                                                                    */
/*                         \_/\      /   --        )  \                                                                   */
/*                              \    /              \  (                                                                  */
/*                              \  (                |  |                                                                  */
/*                               \__\                \_|                                                                  */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___             _       _           _
|___ \   _ __ ___| | __ _| |_ ___  __| |  _ __ ___ _ __   ___  ___
  __) | | `__/ _ \ |/ _` | __/ _ \/ _` | | `__/ _ \ `_ \ / _ \/ __|
 / __/  | | |  __/ | (_| | ||  __/ (_| | | | |  __/ |_) | (_) \__ \
|_____| |_|  \___|_|\__,_|\__\___|\__,_| |_|  \___| .__/ \___/|___/
                                                  |_|
*/

https://github.com/rogerjdeangelis/utl_voronoi_diagram_on_a_shapefile_of_singapore
https://github.com/rogerjdeangelis/utl-add-points-to-a-map-of-slovakia
https://github.com/rogerjdeangelis/utl-ascii-art-outline-maps-of-states-and-countries-AI
https://github.com/rogerjdeangelis/utl-ascii-line-maps-of-the-usa-and-each-state
https://github.com/rogerjdeangelis/utl-creating-zipcode-zcta-choropleth-maps-in-R-and-SAS
https://github.com/rogerjdeangelis/utl-drawing-a-world-map-using-the-eckert-projection-ggplot-map-rnaturalearth
https://github.com/rogerjdeangelis/utl-gis-census-zipcode-maps-no-credit-card-api-or-restrictions-wps-r-tmap
https://github.com/rogerjdeangelis/utl-gis-mapping-with-r-package-rnaturalearth-no-api-credit-card-or-access-limits-
https://github.com/rogerjdeangelis/utl-given-latitude-and-longitude-determine-the-us-state-mapping
https://github.com/rogerjdeangelis/utl-usmap-drilldown
https://github.com/rogerjdeangelis/utl_binning_36_character_and_numeric_variables_with_separate_mappings
https://github.com/rogerjdeangelis/utl_google_and_SAS_maps
https://github.com/rogerjdeangelis/utl_google_map_of_earnings_for_canada_cities
https://github.com/rogerjdeangelis/utl_google_map_of_USA_with_long_and_lat_and_earnings
https://github.com/rogerjdeangelis/utl_graphics_zipcode_boundary_maps
https://github.com/rogerjdeangelis/utl_javascript_and_classic_map_graphics_with_mouseovers_and_multiple_drilldowns
https://github.com/rogerjdeangelis/utl_map_counties_within_one_state_choropleth_map
https://github.com/rogerjdeangelis/utl_proc_gmap_classic_graphics_grid_containing_four_states
https://github.com/rogerjdeangelis/utl-Graphics-Surveying-ten-random-locations-in-North-Carolina-using-superinposed-grid
https://github.com/rogerjdeangelis/utl-how-many-triangles-in-the-polygon-r-igraph-AI
https://github.com/rogerjdeangelis/utl_fun_with_line_printer_graphics_editor
https://github.com/rogerjdeangelis/utl_graphics_589_SAS_and_R_graphics_with_code_and_datasets
https://github.com/rogerjdeangelis/utl_graph_visualize_crosstab/blob/master/utl_graph_visualize_crosstab.pdf
https://github.com/rogerjdeangelis/utl_javascript_and_classic_map_graphics_with_mouseovers_and_multiple_drilldowns
https://github.com/rogerjdeangelis/utl_pdf_graphics_top_40_a_sas_ods_graphics_look_at_chicago_public_schools_salaries_by_job
https://github.com/rogerjdeangelis/utl_pdf_graphics_top_40_a_sas_ods_graphics_look_at_chicago_public_schools_salaries_by_job
https://github.com/rogerjdeangelis/utl_r_graphics_visualizing_assciation_amoung_many_variables

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/

