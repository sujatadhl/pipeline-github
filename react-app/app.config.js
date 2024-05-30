module.exports = {
    apps: [
      {
        name: 'React-app',
        script: 'serve',
        args: '-s build',
        env: {
          PORT: 3000
        }
      }
    ]
  };
  