
ssh2fs = require '../src'
{tmpdir, scratch, they} = require './test'

beforeEach tmpdir

describe 'rmdir', ->

  they 'a dir', ({ssh}) ->
    await ssh2fs.mkdir ssh, "#{scratch}/a_dir"
    await ssh2fs.rmdir ssh, "#{scratch}/a_dir"

  they 'a missing file', ({ssh}) ->
    ssh2fs.rmdir ssh, "#{scratch}/a_dir"
    .should.be.rejectedWith
      message: 'ENOENT: no such file or directory, rmdir \'/tmp/ssh2-fs-test/a_dir\''
      errno: -2
      code: 'ENOENT'
      syscall: 'rmdir'
      path: '/tmp/ssh2-fs-test/a_dir'
