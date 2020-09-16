require_relative '../lib/testing_framework'

test_suite do
  test do
    ejecutado = false
    suite_de_tests = TestSuite.new do
      test { ejecutado = true }
    end

    suite_de_tests.ejecutar

    assert ejecutado
  end

  test do
    ejecutado = false
    suite_de_tests = TestSuite.new do
      test { ejecutado = true }
    end

    assert(!ejecutado)
  end

  test do
    ejecutado = false
    suite_de_tests = TestSuite.new do
      test do
        assert false
        ejecutado = true
      end
    end

    suite_de_tests.ejecutar

    assert(!ejecutado)
  end
end

