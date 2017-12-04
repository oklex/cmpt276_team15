mergeInto(LibraryManager.library, {
  statisticLog :function (
  total_duration,
  longest_duration,
  total_points,
  max_points,
  enemies_killed,
  projectiles_fired,
  accuracy) {
    console.log("total duration: " + total_duration);
    console.log("longest duration: " + longest_duration);
    console.log("total points: " + total_points);
    console.log("max points: " + max_points);
    console.log("enemies killed: " + enemies_killed);
    console.log("projectiles fired: " + projectiles_fired);
    console.log("accuracy: " + accuracy);
  }
}
