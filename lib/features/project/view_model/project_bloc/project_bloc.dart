import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/project/data/model/project.dart';
import 'package:portfolio/features/project/data/repositories/project_repository.dart';

class ProjectBloc extends Cubit<List<Project>>{
  ProjectRepository projectRepository;
  ProjectBloc({required this.projectRepository}):super(projectRepository.getProjects());
}